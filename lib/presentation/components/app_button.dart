import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(final BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade300),
      ),
      onPressed: onPressed,
      child: const Text(
        "Refresh",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
