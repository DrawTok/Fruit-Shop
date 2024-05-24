import 'package:fruitshop/models/mapbox/country.dart';
import 'package:fruitshop/models/mapbox/locality.dart';
import 'package:fruitshop/models/mapbox/place.dart';

class Context {
  final Locality locality;
  final Place place;
  final Country country;

  Context({required this.locality, required this.place, required this.country});

  factory Context.fromJson(Map<String, dynamic> json) {
    return Context(
        locality: Locality.fromJson(json['locality']),
        place: Place.fromJson(json['place']),
        country: Country.fromJson(json['country']));
  }
}
