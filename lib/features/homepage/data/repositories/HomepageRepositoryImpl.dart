import 'package:fake_api_exam/features/homepage/domain/repositories/homepage_repository.dart';

import 'datasource/person_remote_datasource.dart';

class HomepageRepositoryImpl extends HomepageRepository {
  final PersonRemoteDatasource personRemoteDatasource;

  HomepageRepositoryImpl({
    required this.personRemoteDatasource,
  });

  @override
  Future getListOfPersons(int quantity) {
    return personRemoteDatasource.getListOfPersons(quantity);
  }
}
