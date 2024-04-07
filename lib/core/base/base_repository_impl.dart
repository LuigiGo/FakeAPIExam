import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:fake_api_exam/core/const/string_conts.dart';
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
              ServerError(message: StringConst.kSomethingWentWrong),
            );
        }
      } else {
        return Left(
          ServerError(message: StringConst.kSomethingWentWrong),
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(
          ServerError(message: StringConst.kSomethingWentWrong),
        );
      } else {
        return Left(
          ServerError(
            header: StringConst.kSomethingWentWrong,
            message: e.message,
          ),
        );
      }
    }
  }
}
