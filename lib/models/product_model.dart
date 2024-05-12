import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final int price;
  final int quantity;
  String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final RxInt _orderQuantity = 0.obs;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  set orderQuantity(int quantity) => _orderQuantity.value = quantity;

  get getOrderQuantity => _orderQuantity.value;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    String imageUrl = TTexts.noImage;
    if (json.containsKey('images') && json['images'].isNotEmpty) {
      var image = json['images'][0];
      if (image is Map && image.containsKey('url')) {
        imageUrl = image['url'];
      }
    }

    return ProductModel(
        id: json['_id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        quantity: json['quantity'],
        image: imageUrl,
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']));
  }
}
