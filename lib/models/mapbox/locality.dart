class Locality {
  String mapboxId;
  String name;

  Locality({required this.mapboxId, required this.name});

  factory Locality.fromJson(Map<String, dynamic> json) {
    return Locality(mapboxId: json['mapbox_id'], name: json['name']);
  }
}
