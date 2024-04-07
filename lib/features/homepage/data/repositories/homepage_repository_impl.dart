import 'package:either_dart/either.dart';
import 'package:fake_api_exam/core/network/exceptions/server_error.dart';
import 'package:fake_api_exam/features/homepage/data/models/api_response.dart';
import 'package:fake_api_exam/features/homepage/domain/repositories/homepage_repository.dart';

import 'datasource/person_remote_datasource.dart';

class HomepageRepositoryImpl extends HomepageRepository {
  final PersonRemoteDatasource personRemoteDatasource;

  HomepageRepositoryImpl({
    required this.personRemoteDatasource,
  });

  @override
  Future<Either<ServerError, ApiResponse>> getListOfPersons(int quantity) {
    return personRemoteDatasource.getListOfPersons(quantity);
  }
}
