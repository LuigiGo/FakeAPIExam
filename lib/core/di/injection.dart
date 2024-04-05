import 'package:fake_api_exam/core/network/dio_client.dart';
import 'package:fake_api_exam/features/homepage/di/homepage_injection.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.asNewInstance();

Future<void> initDi() async {
  inject.registerLazySingleton(() => DioClient());

  await HomepageInjectionContainer().initHomepageInjector();
}
