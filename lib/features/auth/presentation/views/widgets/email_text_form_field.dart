import 'package:flutter/material.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({super.key, this.validatorCon, this.onSaved});
  final String? Function(String?)? validatorCon;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        validator: validatorCon,
        onSaved: onSaved,
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
