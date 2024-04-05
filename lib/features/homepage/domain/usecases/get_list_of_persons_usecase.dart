import 'package:either_dart/either.dart';
import 'package:fake_api_exam/core/network/exceptions/server_error.dart';
import 'package:fake_api_exam/features/homepage/data/models/api_response.dart';
import 'package:fake_api_exam/features/homepage/domain/repositories/homepage_repository.dart';

class GetListOfPersonsUseCase {
  final HomepageRepository repository;

  GetListOfPersonsUseCase({
    required this.repository,
  });

  Future<Either<ServerError, ApiResponse>> execute(int quantity) async {
    return await repository.getListOfPersons(quantity);
  }
}
