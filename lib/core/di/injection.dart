import 'package:dio/dio.dart';
import 'package:fake_api_exam/core/network/dio_client.dart';
import 'package:fake_api_exam/core/network/http_logging_interceptor.dart';
import 'package:fake_api_exam/core/utils/helpers/dialog_helper.dart';
import 'package:fake_api_exam/core/utils/helpers/image_helpers.dart';
import 'package:fake_api_exam/core/utils/helpers/provider_helper.dart';
import 'package:fake_api_exam/core/utils/helpers/responsive_helper.dart';
import 'package:fake_api_exam/features/homepage/di/homepage_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final inject = GetIt.asNewInstance();

Future<void> initDi() async {
  inject.registerLazySingleton(() => Dio());
  inject.registerLazySingleton(() => Logger());
  inject.registerLazySingleton(() => ImageHelpers());
  inject.registerLazySingleton(() => DialogHelper());
  inject.registerLazySingleton(() => ResponsiveHelper());
  inject.registerLazySingleton(() => ProviderHelper());
  inject.registerLazySingleton(() => HttpLoggingInterceptor(logger: inject()));
  inject.registerLazySingleton(() => DioClient(
        dio: inject(),
        loggingInterceptor: inject(),
      ));

  await HomepageInjectionContainer().initHomepageInjector();
}
