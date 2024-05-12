import 'package:fruitshop/controllers/bottom_bar/bottom_bar_controller.dart';
import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/models/product_model.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/helper/helper_function.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  late ProductModel product;
  var quantity = 1.obs;
  final BottomBarController _controller = Get.find();


  void handleIncrease() {
    if (quantity.value < product.quantity) {
      ++quantity.value;
    }
  }

  void handleDecrease() {
    if (quantity.value > 1) {
      --quantity.value;
    }
  }

  void addCart() async {
    product.orderQuantity = quantity.value;
    var response = await THttpHelper.postWithToken("user/cart/", {
      "cart": [
        {
          "_id": product.id,
          "count": product.getOrderQuantity
        }
      ]
    }, _controller.token);
    if(response != null){
      HelperFunctions.showSnackBar(TTexts.successful, TTexts.cartAddedSuccess);
    }else{
      HelperFunctions.showSnackBar(TTexts.fail, TTexts.errorResponse);

    }
  }

  @override
  void onInit() {
    product = Get.arguments?['productModel'] ?? '';
    super.onInit();
  }
}
