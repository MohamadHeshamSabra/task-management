import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features/auth/cubit/login_cubit.dart';
import 'package:task_manager_app/features/auth/presentation/views/widgets/email_text_form_field.dart';
import 'package:task_manager_app/features/auth/presentation/views/widgets/login_button.dart';
import 'package:task_manager_app/features/auth/presentation/views/widgets/password_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).formKey,
      child: Column(
        children: [
          UserNameTextField(
            validatorCon: (value) {
              if (value!.length <= 4 && value.isNotEmpty) {
                return "The user name should has more then 4 characters";
              } else if (value.isEmpty) {
                return "The user name is requierd";
              }
              return null;
            },
            onSaved: (value) {
              BlocProvider.of<LoginCubit>(context).userNameField = value ?? "";
            },
          ),
          const SizedBox(
            height: 18,
          ),
          PasswordTextField(
            validatorCon: (value) {
              if (value!.length <= 4 && value.isNotEmpty) {
                return "The password should has more then 4 characters";
              } else if (value.isEmpty) {
                return "The password is requierd";
              }
              return null;
            },
            onSaved: (value) {
              BlocProvider.of<LoginCubit>(context).passwordField = value ?? "";
            },
          ),
          const SizedBox(
            height: 24,
          ),
          LoginButton(
            onPressed: () {
              if (BlocProvider.of<LoginCubit>(context)
                  .formKey
                  .currentState!
                  .validate()) {
                BlocProvider.of<LoginCubit>(context)
                    .formKey
                    .currentState!
                    .save();
                BlocProvider.of<LoginCubit>(context).login();
              }
            },
          )
        ],
      ),
    );
  }
}
