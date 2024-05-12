import 'dart:developer';

import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/models/category_model.dart';
import 'package:fruitshop/models/order_model.dart';
import 'package:fruitshop/models/product_model.dart';
import 'package:fruitshop/models/voucher_model.dart';

enum DataType { product, voucher, category, order }

class DataProvider {
  static Future<List<dynamic>> getAllData(
  {required DataType dataType, required String endpoint, String? token}) async {
    try {
      dynamic data;
      if(dataType == DataType.order && token != null){
        data = await THttpHelper.getWithToken(endpoint, token);

      }else{
        data = await THttpHelper.getAll(endpoint);
      }
      switch (dataType) {
        case DataType.product:
          return data.map((json) => ProductModel.fromJson(json)).toList();
        case DataType.voucher:
          return data.map((json) => VoucherModel.fromJson(json)).toList();
        case DataType.category:
          return data.map((json) => CategoryModel.fromJson(json)).toList();
        case DataType.order:
          return data.map((json) => OrderModel.fromJson(json)).toList();
        default:
          return [];
      }
    } catch (e) {
      log('Error $endpoint: $e');
      return [];
    }
  }

  static Future<ProductModel> getData(String endpoint) async {
    try {
      var data = await THttpHelper.get(endpoint);
      return ProductModel.fromJson(data);
    } catch (e) {
      log('Error $endpoint: $e');

      return Future.error('Failed to fetch data from $endpoint');
    }
  }
}
