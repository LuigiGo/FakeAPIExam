import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_api_exam/features/homepage/data/models/api_response.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/get_list_of_persons_usecase.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  final GetListOfPersonsUseCase? getListOfPersonsUseCase;

  HomepageCubit(
    this.getListOfPersonsUseCase,
  ) : super(HomepageInitial());

  Future getListOfPersons(int quantity) async {
    final result = await getListOfPersonsUseCase?.execute(quantity);
    if (result is Response) {
      print(result);
      emit(LoadListOfPersonSuccess(result));
    }
  }
}
