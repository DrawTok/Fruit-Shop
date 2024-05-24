import 'package:fruitshop/models/mapbox/context.dart';
import 'package:fruitshop/models/mapbox/coordinates.dart';

class Properties {
  String mapboxId;
  String fullAddress;
  String name;
  String namePreferred;
  Coordinates coordinates;
  Context context;

  Properties(
      {required this.mapboxId,
      required this.fullAddress,
      required this.name,
      required this.namePreferred,
      required this.coordinates,
      required this.context});

  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties(
        mapboxId: json['mapbox_id'],
        fullAddress: json['full_address'],
        name: json['name'],
        namePreferred: json['name_preferred'],
        coordinates: Coordinates.fromJson(json['coordinates']),
        context: Context.fromJson(json['context']));
  }
}
