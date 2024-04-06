import 'package:either_dart/either.dart';
import 'package:fake_api_exam/core/base/base_repository_impl.dart';
import 'package:fake_api_exam/core/const/api_const.dart';
import 'package:fake_api_exam/core/const/key_const.dart';
import 'package:fake_api_exam/core/network/dio_client.dart';
import 'package:fake_api_exam/core/network/exceptions/server_error.dart';

import '../../models/api_response.dart';
import '../datasource/person_remote_datasource.dart';

class PersonsRemoteDatasourceImpl extends PersonRemoteDatasource
    with BaseRepositoryImpl {
  final DioClient client;

  PersonsRemoteDatasourceImpl({required this.client});

  @override
  Future<Either<ServerError, ApiResponse>> getListOfPersons(
      int quantity) async {
    var response = await call(
      client.getDio().get(
        ApiConst.GET_LIST_OF_PERSONS,
        queryParameters: {
          KeyConst.paramsQuantity: quantity.toString(),
        },
      ),
    );

    return response.fold(
      (failure) => Left(failure),
      (success) {
        ApiResponse data = ApiResponse.fromJson(success.data);
        return Right(data);
      },
    );
  }
}
