import 'package:drag_drop/componants/recipe_list.dart';
import 'package:drag_drop/componants/steps.dart';
import 'package:flutter/material.dart';

class Oatmeal extends StatelessWidget {
  const Oatmeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const SizedBox(height: 90.0),
        const Image(
          image: NetworkImage(
            'https://cdn-icons-png.flaticon.com/512/5609/5609775.png',
          ),
          height: 100,
          width: 100,
        ),
        buildOatmealIngredients(),
        buildOatmealInstructions()
      ],
    );
  }
}
