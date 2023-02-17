import 'package:drag_drop/componants/back_to_start_btn.dart';
import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  const Recipe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: BackBtn(),
          ),
          Center(
            child: SizedBox(
              height: 200,
              child: Column(children: const [Text('data'), Text('data')]),
            ),
          )
        ],
      ),
    );
  }
}
