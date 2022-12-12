import 'package:anti_fraud/features/search_fraud/domain/entities/fraud_line_id.dart';

class FraudLineIDModel extends FraudLineID {
  FraudLineIDModel({required super.id, required super.reportDate});

  factory FraudLineIDModel.fromJson(Map<String, dynamic> json) {
    // todo: reportDate need to be converted
    return FraudLineIDModel(id: json['帳號'], reportDate: DateTime(json['通報日期']));
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'reportDate': reportDate.toString()};
  }
}
