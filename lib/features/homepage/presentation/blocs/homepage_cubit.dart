import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_api_exam/core/network/exceptions/server_error.dart';
import 'package:fake_api_exam/features/homepage/data/models/person.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/get_list_of_persons_usecase.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  final GetListOfPersonsUseCase? getListOfPersonsUseCase;

  HomepageCubit({
    this.getListOfPersonsUseCase,
  }) : super(HomepageInitial());

  Future<void> getListOfPersons(
    int quantity, {
    bool isRefresh = false,
  }) async {
    if (!isRefresh) {
      emit(LoadListOfPersonsLoading());
    } else {
      emit(RefreshHomepage());
    }

    final result = await getListOfPersonsUseCase?.execute(quantity);
    result?.fold(
      (failure) => emit(LoadListOfPersonFailed(failure)),
      (response) => emit(
        LoadListOfPersonSuccess(
          response.data as List<Person>,
          isRefresh: isRefresh,
        ),
      ),
    );
  }
}
