import 'package:drag_drop/componants/cancel_modal.dart';
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
        // ********************
        // change the cancel symbol
        // ********************
        child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/4303/4303935.png'),
      ),
    );
  }
}
