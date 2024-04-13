part of 'all_todos_cubit.dart';

@immutable
sealed class AllTodosState {}

final class AllTodosInitial extends AllTodosState {
  static int limit = 20;
  static int skip = 0;
}

final class AllTodosSuccess extends AllTodosState {
  final List<Tasks>? tasksList;
  static bool completedList = false;
  AllTodosSuccess({this.tasksList});
}

final class ALlTodosLoading extends AllTodosState {}

final class AllTodosFailure extends AllTodosState {
  final String errorMessage;

  AllTodosFailure({required this.errorMessage});
}
