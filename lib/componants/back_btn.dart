import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/8345/8345329.png'),
      ),
    );
  }
}
