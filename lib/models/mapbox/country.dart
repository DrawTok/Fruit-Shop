class Country {
  String mapboxId;
  String name;
  String countryCode;

  Country(
      {required this.mapboxId, required this.name, required this.countryCode});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        mapboxId: json['mapbox_id'],
        name: json['name'],
        countryCode: json['country_code']);
  }

}
