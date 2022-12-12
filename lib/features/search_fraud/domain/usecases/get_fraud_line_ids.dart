import 'package:anti_fraud/core/error/failure.dart';
import 'package:anti_fraud/features/search_fraud/domain/entities/fraud_line_id.dart';
import 'package:anti_fraud/features/search_fraud/domain/repositories/fraud_line_id_repository.dart';
import 'package:dartz/dartz.dart';

class GetFraudLineIDs {
  final FraudLineIDRepository repository;
  GetFraudLineIDs({required this.repository});

  Future<Either<Failure, List<FraudLineID>>> execute() async {
    return await repository.getFraudLineIDs();
  }
}
