import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task_manager_app/core/utils/routes_path.dart';
import 'package:task_manager_app/features/auth/cubit/login_cubit.dart';
import 'package:task_manager_app/features/auth/presentation/views/widgets/login_body_builder.dart';

class LoginPageViewBody extends StatelessWidget {
  const LoginPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(state.errorMessege),
            ),
          );
        } else if (state is LoginSuccess) {
          context.go(Routes.homePageView);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const ModalProgressHUD(
              inAsyncCall: true, child: LoginBodyBuilder());
        } else {
          return const LoginBodyBuilder();
        }
      },
    );
  }
}
