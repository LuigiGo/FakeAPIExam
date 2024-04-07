import 'package:fake_api_exam/features/homepage/data/repositories/homepage_repository_impl.dart';
import 'package:fake_api_exam/features/homepage/data/repositories/datasource/person_remote_datasource.dart';
import 'package:fake_api_exam/features/homepage/data/repositories/datasourceimpl/persons_remote_datasource_impl.dart';
import 'package:fake_api_exam/features/homepage/domain/repositories/homepage_repository.dart';
import 'package:fake_api_exam/features/homepage/domain/usecases/get_list_of_persons_usecase.dart';

import '../../../core/di/injection.dart';

class HomepageInjectionContainer {
  Future<void> initHomepageInjector() async {
    /// Datasource
    inject.registerLazySingleton<PersonRemoteDatasource>(
        () => PersonsRemoteDatasourceImpl(client: inject()));

    /// Repository
    inject.registerLazySingleton<HomepageRepository>(
        () => HomepageRepositoryImpl(personRemoteDatasource: inject()));

    /// Usecase
    inject.registerLazySingleton(
        () => GetListOfPersonsUseCase(repository: inject()));
  }
}
