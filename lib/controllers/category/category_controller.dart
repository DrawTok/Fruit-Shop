import 'package:fruitshop/controllers/home/home_controller.dart';
import 'package:fruitshop/screens/search/search.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();


  var categories = [];

  void onChooseCategory(String id) {
    Get.to(const SearchScreen(), arguments: {'id': id});
  }

 

  @override
  void onInit() {
    categories = Get.find<HomeController>().categories;
    super.onInit();
  }

 
}
