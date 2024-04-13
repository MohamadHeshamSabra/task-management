import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager_app/core/utils/images_assets.dart';
import 'package:task_manager_app/features/auth/presentation/views/widgets/login_form.dart';

class LoginBodyBuilder extends StatelessWidget {
  const LoginBodyBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ListView(
      children: [
        const SizedBox(
          height: 80,
        ),
        SvgPicture.asset(
          ImagesAssets.splashIcon,
          height: height * .25,
        ),
        const SizedBox(
          height: 18,
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Log In",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        const LoginForm(),
      ],
    );
  }
}
