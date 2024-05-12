import 'package:fruitshop/models/product_model.dart';

class OrderItem {
  ProductModel product;
  int count;

  OrderItem({
    required this.product,
    required this.count,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      product: ProductModel.fromJson(json['product']),
      count: json['count'],

    );
  }
}
