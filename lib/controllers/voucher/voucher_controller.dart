import 'package:fruitshop/providers/data_provider.dart';
import 'package:get/get.dart';

class VoucherController extends GetxController {
  static VoucherController get instance => Get.find();

  var vouchers = [].obs;
  RxBool isLoading = true.obs;

  void handleUseCoupons(int index) {
    Get.back(result: vouchers[index].percentage);
  }

  void _getVoucher() {
    isLoading.value = true;

    DataProvider.getAllData(dataType: DataType.voucher, endpoint: 'discount')
        .then((vouchers) {
      this.vouchers.value = vouchers;
      isLoading.value = false;
    });
  }

  void isExpiredVoucher() {}

  @override
  void onInit() {
    _getVoucher();
    super.onInit();
  }
}
