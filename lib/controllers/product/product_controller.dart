import 'package:fruitshop/providers/data_provider.dart';
import 'package:fruitshop/providers/database_provider.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  var productInfo = Rxn<dynamic>();
  var quantity = 1.obs;

  Future<void> getProductInfo(String productId) async {
    productInfo.value = await DataProvider.getData('product/$productId');
  }

  void handleIncrease() {
    if (quantity.value < productInfo.value.quantity) {
      ++quantity.value;
    }
  }

  void handleDecrease() {
    if (quantity.value > 1) {
      --quantity.value;
    }
  }

  void addCart() async {
    await DatabaseProvider.insertCart(
      {
        'id': productInfo.value.id,
        'name': productInfo.value.name,
        'description': productInfo.value.description,
        'price': productInfo.value.price,
        'quantity': productInfo.value.quantity,
        'orderQuantity': quantity.value,
        'image': productInfo.value.image,
        'createdAt': productInfo.value.createdAt.toString(),
        'updatedAt': productInfo.value.updatedAt.toString(),
      },
    );
  }

  @override
  void onInit() {
    var productId = Get.arguments?['productId'] ?? '';
    getProductInfo(productId);
    super.onInit();
  }
}
