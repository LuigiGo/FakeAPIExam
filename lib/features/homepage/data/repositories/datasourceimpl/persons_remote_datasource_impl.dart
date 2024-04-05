import 'package:fake_api_exam/core/const/apiconst.dart';
import 'package:fake_api_exam/core/network/dio_client.dart';

import '../datasource/person_remote_datasource.dart';

class PersonsRemoteDatasourceImpl extends PersonRemoteDatasource {
  final DioClient client;

  PersonsRemoteDatasourceImpl({required this.client});

  @override
  Future getListOfPersons(int quantity) {
    return client.getDio().get(ApiConst.GET_LIST_OF_PERSONS, queryParameters: {
      '_quantity': quantity.toString(),
    });
  }
}
