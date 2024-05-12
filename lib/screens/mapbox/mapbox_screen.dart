import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/mapbox/map_controller.dart';
import 'package:fruitshop/placeholder/loading/loading.dart';
import 'package:fruitshop/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapBoxScreen extends StatelessWidget {
  const MapBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MapController controller = Get.put(MapController());

    return Scaffold(
        appBar: const TAppBar(title: 'Vị trí hiện tại'),
        backgroundColor: Colors.white,
        body: Obx(() => controller.isLoading.isTrue
            ? const TLoading()
            : MapboxMap(
                accessToken: controller.accessToken,
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: CameraPosition(
                    target: LatLng(controller.position!.latitude,
                        controller.position!.longitude),
                    zoom: 15),
              )));
  }
}

