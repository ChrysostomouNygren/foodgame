import 'package:drag_drop/pages/home_page.dart';
import 'package:flutter/material.dart';

class Back2StartBtn extends StatelessWidget {
  Back2StartBtn({super.key, required this.props});

  String props;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Home();
        }));
      },
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image.asset(props),
      ),
    );
  }
}
