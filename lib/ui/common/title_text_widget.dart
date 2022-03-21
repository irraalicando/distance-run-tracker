import 'package:flutter/material.dart';

import '../constants/theme.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: AppText.titleStyle,
      ),
    );
  }

  const TitleTextWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
}
