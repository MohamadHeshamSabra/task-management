part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginFailure extends LoginState {
  final String errorMessege;

  LoginFailure({required this.errorMessege});
}

final class LoginSuccess extends LoginState {}

final class LoginLoading extends LoginState {}
