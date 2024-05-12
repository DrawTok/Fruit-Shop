class VoucherModel {
  final String id;
  final String code;
  final int percentage;
  final DateTime startDate;
  final DateTime endDate;

  VoucherModel(
      {required this.id,
      required this.code,
      required this.percentage,
      required this.startDate,
      required this.endDate});

  bool isExpired(){
    DateTime current = DateTime.now();
    return endDate.isBefore(current);
  }

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    
    return VoucherModel(
      id: json['_id'],
      code: json['code'],
      percentage: json['percentage'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      
    );
  }
}
