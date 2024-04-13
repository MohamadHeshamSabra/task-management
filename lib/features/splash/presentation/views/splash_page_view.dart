import 'package:flutter/material.dart';
import 'package:task_manager_app/features/splash/presentation/views/widgets/splash_page_view_body.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashPageViewBody(),
    );
  }
}
