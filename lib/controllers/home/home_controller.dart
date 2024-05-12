import 'package:fruitshop/controllers/bottom_bar/bottom_bar_controller.dart';
import 'package:fruitshop/controllers/cart/cart_controller.dart';
import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/models/product_model.dart';
import 'package:fruitshop/providers/data_provider.dart';
import 'package:fruitshop/screens/product/product_detail.dart';
import 'package:fruitshop/screens/search/search.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/helper/helper_function.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final BottomBarController _controller = Get.find<BottomBarController>();

  RxBool isLoading = true.obs;
  var currentIndex = 0.obs;
  var categories = [].obs;
  var products = [].obs;

  void updatePageIndicator(int index) => currentIndex.value = index;

  void directionCategory() => Get.toNamed('/category');

  void getCategories() {
    isLoading.value = true;
    DataProvider.getAllData(dataType: DataType.category, endpoint: 'category')
        .then((categories) {
      this.categories.value = categories;
    });
  }

  void getProducts() {
    DataProvider.getAllData(dataType: DataType.product, endpoint: 'product')
        .then((products) {
      this.products.value = products;
      isLoading.value = false;
    });
  }

  void addCart(ProductModel productModel) async {
    var response = await THttpHelper.postWithToken(
        "user/cart/",
        {
          "cart": [
            {"_id": productModel.id, "count": 1}
          ]
        },
        _controller.token);
    if (response != null) {
      HelperFunctions.showSnackBar(TTexts.successful, TTexts.cartAddedSuccess);
    } else {
      HelperFunctions.showSnackBar(TTexts.fail, TTexts.errorResponse);
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

  void displayDetailProduct(ProductModel product) {
    Get.to(const ProductDetail(), arguments: {'productModel': product});
  }

  @override
  void onInit() {
    getCategories();
    getProducts();
    super.onInit();
  }
}
