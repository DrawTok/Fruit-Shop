import 'package:fruitshop/providers/voucher_provider.dart';
import 'package:get/get.dart';

class VoucherController extends GetxController {
  static VoucherController get instance => Get.find();

  var vouchers = [].obs;
  final VoucherProvider _voucherProvider = VoucherProvider();

  void handleUseCoupons(int index) {
    Get.back(result: vouchers[index].percentage);
  }

  void _getVoucher() {
    _voucherProvider
        .getVouchers('discount')
        .then((vouchers) => this.vouchers.value = vouchers);
  }

  @override
  void onInit() {
    _getVoucher();
    super.onInit();
  }
}
