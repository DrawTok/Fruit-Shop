class Place {
  String mapboxId;
  String name;
  String shortCode;

  Place({required this.mapboxId, required this.name, required this.shortCode});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        mapboxId: json['mapbox_id'],
        name: json['name'],
        shortCode: json['short_code']);
  }
}
