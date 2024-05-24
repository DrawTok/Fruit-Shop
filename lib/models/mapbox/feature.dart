import 'package:fruitshop/models/mapbox/property.dart';

class Feature {
  final String type;
  final String id;
  final Properties properties;

  Feature({required this.type, required this.id, required this.properties});

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
        type: json['type'],
        id: json['id'],
        properties: Properties.fromJson(json['properties']));
  }
}
