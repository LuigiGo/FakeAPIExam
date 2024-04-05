part of 'homepage_cubit.dart';

@immutable
sealed class HomepageState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomepageInitial extends HomepageState {}

final class LoadListOfPersonSuccess extends HomepageState {
  final Response apiResponse;

  LoadListOfPersonSuccess(this.apiResponse);
}
