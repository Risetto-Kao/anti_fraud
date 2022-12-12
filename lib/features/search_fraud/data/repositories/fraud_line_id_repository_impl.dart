import 'package:anti_fraud/core/error/exception.dart';
import 'package:anti_fraud/core/platform/network_info.dart';
import 'package:anti_fraud/features/search_fraud/data/datasources/fraud_line_id_local_data_source.dart';
import 'package:anti_fraud/features/search_fraud/data/datasources/fraud_line_id_remote_data_source.dart';
import 'package:anti_fraud/features/search_fraud/domain/entities/fraud_line_id.dart';
import 'package:anti_fraud/core/error/failure.dart';
import 'package:anti_fraud/features/search_fraud/domain/repositories/fraud_line_id_repository.dart';
import 'package:dartz/dartz.dart';

class FraudLineIDRepositoryImpl implements FraudLineIDRepository {
  final FraudLineIDRemoteDataSource remoteDataSource;
  final FraudLineIDLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FraudLineIDRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<FraudLineID>>> getFraudLineIDs() async {
    // TODO: implement getFraudLineIDs
    if (await networkInfo.isConnected) {
      try {
        final remoteFraudLineIDs = await remoteDataSource.getFraudLineIDs();
        localDataSource.cacheFraudLineIDs(remoteFraudLineIDs);
        return Right(remoteFraudLineIDs);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localFraudLineIDs = await localDataSource.getLastFraudLineIDs();
        return Right(localFraudLineIDs);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
