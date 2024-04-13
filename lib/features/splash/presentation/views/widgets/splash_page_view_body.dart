import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/core/utils/images_assets.dart';
import 'package:task_manager_app/core/utils/routes_path.dart';

class SplashPageViewBody extends StatefulWidget {
  const SplashPageViewBody({super.key});

  @override
  State<SplashPageViewBody> createState() => _SplashPageViewBodyState();
}

class _SplashPageViewBodyState extends State<SplashPageViewBody> {
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    timeOut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "MHesham Sabra",
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SvgPicture.asset(
              ImagesAssets.splashIcon,
              height: 240,
            ),
            const Spacer(),
            const Text(
              "version 1",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  timeOut() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        context.go(sharedPreferences.get("token") == null
            ? Routes.loginPageView
            : Routes.homePageView);
      },
    );
  }
}
