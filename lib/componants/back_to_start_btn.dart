import 'package:drag_drop/pages/home_page.dart';
import 'package:flutter/material.dart';

class Back2StartBtn extends StatelessWidget {
  const Back2StartBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // vvv homepage vvv
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Home();
        }));
        // vvv previous page vvv
        // Navigator.of(context).pop();
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
