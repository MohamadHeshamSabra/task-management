part of 'my_todos_cubit.dart';

@immutable
sealed class MyTodosState {}

final class MyTodosInitial extends MyTodosState {}

final class MyTodosLoading extends MyTodosState {}

final class MyTodosFailure extends MyTodosState {
  final String errorMessage;

  MyTodosFailure({required this.errorMessage});
}

final class MyTodosSuccess extends MyTodosState {
  final List<Tasks>? tasksList;
  MyTodosSuccess({this.tasksList});
}
