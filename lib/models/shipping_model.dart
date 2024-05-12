class ShippingModel {
  final String firstname;
  final String lastname;
  final String address;
  final String email;
  final String methodPayment;
  final String phoneNumber;

  ShippingModel(
      {required this.firstname,
      required this.lastname,
      required this.address,
      required this.email,
      required this.methodPayment,
      required this.phoneNumber});

  factory ShippingModel.fromJson(Map<String, dynamic> json) {
    return ShippingModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      address: json['address'],
      email: json['email'],
      methodPayment: json['methodPayment'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
