import 'dart:async';
import 'package:fruitshop/controllers/cart/cart_controller.dart';
import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/providers/data_provider.dart';
import 'package:fruitshop/providers/database_provider.dart';
import 'package:fruitshop/screens/product/product_detail.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/helper/helper_function.dart';
import 'package:get/get.dart';

class TSearchController extends GetxController {
  static TSearchController get instance => Get.find();
  CartController cartController = Get.find();

  var products = [].obs;
  var filteredProducts = [].obs;
  var id = '';
  var query = ''.obs;
  var isFilter = false.obs;
  var preSelected = 0;
  var selectedOptions = 0.obs;
  Timer? _debounce;

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

  void updateQuery(String newQuery) {
    query.value = newQuery;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      onSearch();
    });
  }

  void onSearch() {
    final lowercaseQuery = query.value.toLowerCase();
    filteredProducts.assignAll(products.where((product) =>
        product.name.toString().toLowerCase().contains(lowercaseQuery)));
  }

  void onChangeFilterType(int type) {
    selectedOptions.value = type;
    if (preSelected != selectedOptions.value) {
      sortProducts();
      preSelected = selectedOptions.value;
    }
  }

  void showFilterScreen() {
    isFilter.value = !isFilter.value;
  }

  void sortProducts() {
    switch (selectedOptions.value) {
      case 0:
        filteredProducts.assignAll(products.toList()
          ..sort((fProduct, sProduct) =>
              fProduct.price.compareTo(sProduct.price)));
        break;
      case 1:
        filteredProducts.assignAll(products.toList()
          ..sort((fProduct, sProduct) =>
              sProduct.price.compareTo(fProduct.price)));
        break;
      case 2:
        break;
      default:
        break;
    }
  }

  Future<void> getProducts(String categoryId) async {
    String endpoint = 'product';
    if (categoryId != '') {
      endpoint = 'product/category/$categoryId';
    }

    final fetchedProducts =
        await DataProvider.getAllData(DataType.product, endpoint);
    products.assignAll(fetchedProducts);
    sortProducts();
  }

  void displayDetailProduct(String productId) {
    Get.to(const ProductDetail(), arguments: {'productId': productId});
  }

  @override
  void onInit() {
    var id = Get.arguments?['id'] ?? '';
    getProducts(id);
    super.onInit();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
