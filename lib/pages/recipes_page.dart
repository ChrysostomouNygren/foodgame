import 'package:drag_drop/pages/recipe_page.dart';
import 'package:flutter/material.dart';

class Recipes extends StatelessWidget {
  const Recipes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Recipe();
            }));
          },
          child: const Text('Recipe componant'),
        ),
      ),
    );
  }
}
