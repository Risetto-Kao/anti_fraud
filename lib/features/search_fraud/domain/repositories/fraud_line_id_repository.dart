import 'package:anti_fraud/core/error/failure.dart';
import 'package:anti_fraud/features/search_fraud/domain/entities/fraud_line_id.dart';
import 'package:dartz/dartz.dart';

abstract class FraudLineIDRepository {
  Future<Either<Failure, List<FraudLineID>>> getFraudLineIDs();
}
