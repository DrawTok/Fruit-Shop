import 'package:fruitshop/controllers/cart/cart_controller.dart';
import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/providers/data_provider.dart';
import 'package:fruitshop/providers/database_provider.dart';
import 'package:fruitshop/screens/product/product_detail.dart';
import 'package:fruitshop/screens/search/search.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/helper/helper_function.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  CartController cartController = Get.find();

  RxBool isLoading = true.obs;
  var currentIndex = 0.obs;
  var categories = [].obs;
  var products = [].obs;

  void updatePageIndicator(int index) => currentIndex.value = index;

  void directionCategory() => Get.toNamed('/category');

  void getCategories() {
    isLoading.value = true;
    DataProvider.getAllData(DataType.category, 'category').then((categories) {
      this.categories.value = categories;
    });
  }

  void getProducts() {
    DataProvider.getAllData(DataType.product, 'product').then((products) {
      this.products.value = products;
      isLoading.value = false;
    });
  }

  void addCart(int index) async {
    var response = await THttpHelper.postWithToken("user/cart/", {
      "cart": [
        {
          "_id": products[index].id,
          "count": 1
        }
      ]
    }, cartController.token);
    if(response != null){
      HelperFunctions.showSnackBar(TTexts.successful, TTexts.cartAddedSuccess);
    }else{
      HelperFunctions.showSnackBar(TTexts.fail, TTexts.addCartFailed);

    }
  }

  void openContacts() async {
    if (await launchUrlString("tel://0399238035")) {
    } else {
      throw 'Could not launch';
    }
  }

  void onSearch() {
    Get.to(const SearchScreen());
  }

  void onChooseCategory(String id) {
    Get.to(const SearchScreen(), arguments: {'id': id});
  }

  void displayDetailProduct(String productId) {
    Get.to(const ProductDetail(), arguments: {'productId': productId});
  }

  @override
  void onInit() {
    getCategories();
    getProducts();
    super.onInit();
  }
}
