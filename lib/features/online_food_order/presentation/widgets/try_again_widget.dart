import 'package:flutter/material.dart';

void tryAgain(BuildContext context, VoidCallback onTryAgain) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Try Again'),
      content: const Text('Something went wrong, please try again'),
      actions: [
        TextButton(
          onPressed: () {
            onTryAgain();
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
