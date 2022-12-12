import 'package:anti_fraud/features/search_fraud/data/models/fraud_line_id_model.dart';

abstract class FraudLineIDRemoteDataSource {
  Future<List<FraudLineIDModel>> getFraudLineIDs();
}

class FraudLineIDRemoteDataSourceImpl implements FraudLineIDRemoteDataSource {
  @override
  Future<List<FraudLineIDModel>> getFraudLineIDs() {
    // TODO: implement getFraudLineIDs
    throw UnimplementedError();
  }
}
