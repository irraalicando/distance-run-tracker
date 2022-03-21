import 'package:flutter/material.dart';
import 'package:snack/snack.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return _buildErrorMessage();
  }

  Widget _buildErrorMessage() {
    if (message.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        SnackBar bar = SnackBar(content: Text(message));
        bar.show(context);
      });
    }

    return const SizedBox.shrink();
  }

  const ErrorMessage({
    Key? key,
    required this.message,
    required this.context,
  }) : super(key: key);
}
