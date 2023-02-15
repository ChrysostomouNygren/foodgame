import 'package:drag_drop/componants/back_btn.dart';
import 'package:drag_drop/pages/recipe_page.dart';
import 'package:flutter/material.dart';

class Recipes extends StatelessWidget {
  const Recipes({
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
              child: Column(children: [
                const Text('data'),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Recipe();
                      }));
                    },
                    child: const Text('recipe componant'))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
