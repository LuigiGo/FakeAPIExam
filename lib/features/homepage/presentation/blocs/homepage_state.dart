part of 'homepage_cubit.dart';

@immutable
sealed class HomepageState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomepageInitial extends HomepageState {}

final class RefreshHomepage extends HomepageState {}

final class LoadListOfPersonsLoading extends HomepageState {}

final class LoadListOfPersonSuccess extends HomepageState {
  final List<Person> persons;
  final bool isRefresh;

  LoadListOfPersonSuccess(
    this.persons, {
    this.isRefresh = false,
  });
}

final class LoadListOfPersonFailed extends HomepageState {
  final ServerError serverError;

  LoadListOfPersonFailed(this.serverError);
}
