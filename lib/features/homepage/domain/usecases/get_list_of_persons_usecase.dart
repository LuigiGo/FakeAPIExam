import 'package:fake_api_exam/features/homepage/domain/repositories/homepage_repository.dart';

class GetListOfPersonsUseCase {
  final HomepageRepository repository;

  GetListOfPersonsUseCase({
    required this.repository,
  });

  Future execute(int quantity) async {
    return await repository.getListOfPersons(quantity);
  }
}
