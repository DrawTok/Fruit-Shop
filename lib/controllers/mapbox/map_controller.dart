import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fruitshop/utils/devices/device_utility.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';


class MapController extends GetxController {
  static MapController get instance => Get.find();

  late MapboxMapController mbmController;
  String accessToken = dotenv.env['ACCESS_TOKEN_MAP'].toString();
  Position? position;
  RxBool isLoading = true.obs;

  void onMapCreated(MapboxMapController controller) async {
    mbmController = controller;
    await loadMarkerImage();
    if (position != null) {
      await mbmController.addSymbol(SymbolOptions(
          iconSize: 0.3,
          geometry: LatLng(position!.latitude, position!.latitude),
          iconImage: 'current_marker',
          iconAnchor: 'bottom'));
    }


  }

  Future<void> loadMarkerImage() async {
    try {
      ByteData byteData = await rootBundle.load("assets/icons/current.png");
      var markerImage = byteData.buffer.asUint8List();
      await mbmController.addImage('current_marker', markerImage);
    } catch (e) {
      log("Error loading marker image: $e");
    }
  }

  void requestPermission() async {
    position = await TDeviceUtility.requestPermission();
    if(position != null){
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    requestPermission();
    super.onInit();
  }
}
