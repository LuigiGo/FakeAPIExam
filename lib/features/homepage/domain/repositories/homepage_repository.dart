import 'package:either_dart/either.dart';
import 'package:fake_api_exam/core/network/exceptions/server_error.dart';
import 'package:fake_api_exam/features/homepage/data/models/api_response.dart';

abstract class HomepageRepository {
  Future<Either<ServerError, ApiResponse>> getListOfPersons(int quantity);
}
