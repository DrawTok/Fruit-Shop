import 'package:fruitshop/models/order_item.dart';
import 'package:fruitshop/models/product_model.dart';
import 'package:fruitshop/models/shipping_model.dart';

class OrderModel {
  final ShippingModel shippingModel;
  final String id;
  final String user;
  final List<OrderItem> orderItems;
  final DateTime paidAt;
  final int totalPrice;
  final String orderStatus;
  final String isPaid;

  OrderModel({
    required this.shippingModel,
    required this.id,
    required this.user,
    required this.orderItems,
    required this.paidAt,
    required this.totalPrice,
    required this.orderStatus,
    required this.isPaid,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      shippingModel: ShippingModel.fromJson(json['shippingInfor']),
      id: json['_id'],
      user: json['user'],
      orderItems: (json['orderItems'] as List).map((item) {
        return OrderItem.fromJson(item);
      }).toList(),
      paidAt: DateTime.parse(json['paidAt']),
      totalPrice: json['totalPrice'],
      orderStatus: json['orderStatus'],
      isPaid: json['isPaid'],
    );
  }
}
