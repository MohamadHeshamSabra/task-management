part of 'add_new_todo_cubit.dart';

@immutable
sealed class AddNewTodoState {}

final class AddNewTodoInitial extends AddNewTodoState {}

final class AddNewTodoLoading extends AddNewTodoState {}

final class AddNewTodoFailure extends AddNewTodoState {}

final class AddNewTodoSuccess extends AddNewTodoState {}
