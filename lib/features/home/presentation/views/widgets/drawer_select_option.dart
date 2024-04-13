import 'package:flutter/material.dart';

class DrawerSelectOption extends StatelessWidget {
  const DrawerSelectOption({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        color: const Color.fromARGB(130, 127, 125, 125),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.black,
              height: 50,
              width: 5,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
