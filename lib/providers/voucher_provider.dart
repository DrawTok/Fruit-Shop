import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/models/voucher_model.dart';

class VoucherProvider {
  Future<List<VoucherModel>> getVouchers(String endpoint) async {
    try {
      var vouchers = await THttpHelper.getAll(endpoint);
      List<VoucherModel> voucherModels = [];
      VoucherModel voucherModel;
      for (var voucher in vouchers) {
        voucherModel = VoucherModel.fromJson(voucher);
        voucherModels.add(voucherModel);
      }
      return voucherModels;
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }
}
