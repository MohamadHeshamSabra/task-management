// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/core/utils/variables.dart';
import 'package:task_manager_app/features/auth/data/repos/login_repos.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepos) : super(LoginInitial());
  String userNameField = "";
  String passwordField = "";
  LoginRepos loginRepos;
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(LoginLoading());
    var result = await loginRepos.loginWithUserNameAndPassword(
      Variables.loginUrlPath,
      {"username": userNameField, "password": passwordField},
    );

    result.fold(
      (failuers) => emit(
        LoginFailure(
          errorMessege: failuers.erorrMassage,
        ),
      ),
      (user) => emit(
        LoginSuccess(),
      ),
    );
  }
}
