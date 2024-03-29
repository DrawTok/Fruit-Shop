import 'package:get/get.dart';

class BottomBarController extends GetxController {

  BottomBarController get instance => Get.find();

  final selectedItem = 0.obs;

  final screens = [];
}
