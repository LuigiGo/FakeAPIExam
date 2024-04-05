import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:fake_api_exam/core/network/exceptions/server_error.dart';

mixin BaseRepositoryImpl {
  Future<Either<ServerError, Type>> call<Type>(Future<Type> httpCall) async {
    try {
      var response = await httpCall;
      if (response is Response) {
        switch (response.statusCode) {
          case 200:
            return Right(response);
          default:
            return Left(
              ServerError(message: 'Error!'),
            );
        }
      } else {
        print('Error!');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Success: ${e.response}');
      } else {
        print('Error!');
      }
    }
    return Left(
      ServerError(message: 'Error!'),
    );
  }
}
