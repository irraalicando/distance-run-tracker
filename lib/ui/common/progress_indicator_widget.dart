
import 'package:flutter/material.dart';

import '../constants/theme.dart';

class CustomProgressIndicatorWidget extends StatelessWidget {
  const CustomProgressIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        child: const FittedBox(
          fit: BoxFit.none,
          child: SizedBox(
            height: 100,
            width: 100,
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: CircularProgressIndicator(strokeWidth: 4, color: AppColors.primaryColor),
            ),
          ),
        ),
        decoration: const BoxDecoration(
            color: Colors.transparent),
      ),
    );
  }
}
