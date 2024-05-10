import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:permission_handler/permission_handler.dart';

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
          geometry: LatLng(position!.latitude, position!.longitude),
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

  Future<void> getPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      getPosition().then((_) {
        isLoading.value = false;
      }).catchError((error) {
        log("Error getting position: $error");
        isLoading.value = false;
      });

    } else if (status.isDenied) {
      // Quyền bị từ chối, hiển thị thông báo hoặc yêu cầu lại quyền
    } else if (status.isPermanentlyDenied) {
      return;
    }
  }

  @override
  void onInit() {
    requestPermission();
    super.onInit();
  }
}
