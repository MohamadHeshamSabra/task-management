import 'package:flutter/material.dart';
import 'package:task_manager_app/features/auth/presentation/views/widgets/login_page_view_body.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPageViewBody(),
    );
  }
}
