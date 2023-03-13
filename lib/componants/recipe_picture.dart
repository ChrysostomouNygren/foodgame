import 'package:drag_drop/componants/recipe_list.dart';
import 'package:drag_drop/componants/steps.dart';
import 'package:flutter/material.dart';

class Oatmeal extends StatelessWidget {
  const Oatmeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 90.0),
        const Expanded(
          child: Image(
            image: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/5609/5609775.png',
            ),
            height: 100,
            width: 100,
          ),
        ),
        Expanded(flex: 1, child: buildOatmealIngredients()),
        Expanded(flex: 1, child: buildOatmealInstructions())
      ],
    );
  }
}

class VeggieSoup extends StatelessWidget {
  const VeggieSoup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 90.0),
        const Expanded(
          child: Image(
            image: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/2388/2388080.png',
            ),
            height: 100,
            width: 100,
          ),
        ),
        Expanded(flex: 2, child: buildVeggieSoupIngredients()),
        Expanded(flex: 2, child: buildVeggieSoupInstructions())
      ],
    );
  }
}
