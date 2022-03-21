import 'package:flutter/material.dart';

class EmptyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}
