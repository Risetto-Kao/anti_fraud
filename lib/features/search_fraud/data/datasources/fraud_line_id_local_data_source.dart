import 'dart:convert';

import 'package:anti_fraud/core/error/exception.dart';
import 'package:anti_fraud/features/search_fraud/data/models/fraud_line_id_model.dart';
import 'package:anti_fraud/features/search_fraud/domain/entities/fraud_line_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FraudLineIDLocalDataSource {
  Future<List<FraudLineIDModel>> getLastFraudLineIDs();
  Future<void> cacheFraudLineIDs(List<FraudLineIDModel> toCache);
}

class FraudLineIDLocalDataSourceImpl implements FraudLineIDLocalDataSource {
  final SharedPreferences sharedPreferences;
  FraudLineIDLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheFraudLineIDs(List<FraudLineIDModel> toCache) {
    throw UnimplementedError();
  }

  @override
  Future<List<FraudLineIDModel>> getLastFraudLineIDs() {
    final jsonString = sharedPreferences.getString('CACHED_LINE_ID');
    // todo: think about how to deal with data list
    if (jsonString != null) {
      return Future.value([FraudLineIDModel.fromJson(json.decode(jsonString))]);
    } else {
      throw CacheException();
    }
  }
}
