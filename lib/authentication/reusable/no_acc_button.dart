import 'package:flutter/material.dart';

class NoAccButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NoAccButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: RichText(
        text: const TextSpan(children: [
          TextSpan(
            text: 'No Account? ',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ]),
      ),
    );
  }
}
