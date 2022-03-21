
import 'package:flutter/material.dart';

import '../constants/theme.dart';


class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final IconData? icon;

  const RoundedButtonWidget({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null ? const SizedBox() :
            Row(
              children: [
                Icon(icon, color: textColor,),
              ],
            ),
            Text(
              buttonText.toUpperCase(),
              style: AppText.subTitleStyle.copyWith(color: textColor)
            ),
          ],
        ),
      ),
    );
  }
}
