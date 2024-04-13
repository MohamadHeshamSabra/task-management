import 'package:flutter/material.dart';
import 'package:task_manager_app/core/utils/app_color.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.primaryColor,
      height: 150,
      minWidth: 150,
      shape: const CircleBorder(),
      onPressed: onPressed,
      child: const Text(
        "Conform",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
