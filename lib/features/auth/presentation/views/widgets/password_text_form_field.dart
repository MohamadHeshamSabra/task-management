import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager_app/core/utils/images_assets.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.validatorCon,
    this.onSaved,
  });
  final String? Function(String?)? validatorCon;
  final void Function(String?)? onSaved;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureTextVar = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        validator: widget.validatorCon,
        obscureText: obscureTextVar,
        onSaved: widget.onSaved,
        decoration: InputDecoration(
          border: inputBorderFun(
            choosedColor: const Color.fromARGB(255, 133, 130, 130),
          ),
          focusedBorder: inputBorderFun(
            choosedColor: const Color.fromARGB(255, 133, 130, 130),
          ),
          enabledBorder: inputBorderFun(
            choosedColor: const Color.fromARGB(255, 133, 130, 130),
          ),
          errorBorder: inputBorderFun(
            choosedColor: const Color.fromARGB(255, 133, 130, 130),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              obscureTextVar = !obscureTextVar;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: SvgPicture.asset(
                // ignore: deprecated_member_use
                color: const Color.fromARGB(255, 133, 130, 130),
                obscureTextVar
                    ? ImagesAssets.closedEyeIcon
                    : ImagesAssets.eyeIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }

  inputBorderFun({required Color choosedColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: choosedColor),
    );
  }
}
