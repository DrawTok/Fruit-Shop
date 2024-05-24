class Coordinates {
  double longitude;
  double latitude;

  Coordinates({required this.longitude, required this.latitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
        latitude: json['latitude'], longitude: json['longitude']);
  }
}
