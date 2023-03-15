import 'package:drag_drop/components/cancel_modal.dart';
import 'package:flutter/material.dart';

class CancelBtn extends StatelessWidget {
  const CancelBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        cancelModal(context);
      },
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image.asset('assets/close.png'),
      ),
    );
  }
}
