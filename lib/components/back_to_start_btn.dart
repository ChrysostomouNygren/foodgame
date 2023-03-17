import 'package:drag_drop/pages/home_page.dart';
import 'package:flutter/material.dart';

class Back2StartBtn extends StatelessWidget {
  const Back2StartBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Home();
        }));
      },
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image.asset('assets/images/back.png'),
      ),
    );
  }
}
