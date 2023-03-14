import 'package:drag_drop/componants/build_ingredient.dart';
import 'package:drag_drop/componants/build_instructions.dart';
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
        const SizedBox(
          height: 90,
        ),
        Expanded(flex: 1, child: buildOatmealIngredients()),
        const SizedBox(
          height: 5,
        ),
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
        const SizedBox(
          height: 90,
        ),
        Expanded(flex: 2, child: buildVeggieSoupIngredients()),
        const SizedBox(
          height: 5,
        ),
        Expanded(flex: 2, child: buildVeggieSoupInstructions())
      ],
    );
  }
}

class GreekSalad extends StatelessWidget {
  const GreekSalad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 90.0,
        ),
        const Expanded(
            child: Image(
          image: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/5100/5100241.png'),
          height: 200,
          width: 200,
        )),
        const SizedBox(
          height: 90,
        ),
        Expanded(
          flex: 1,
          child: buildGreekSaladIngredients(),
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          flex: 1,
          child: buildGreekSaladInstructions(),
        )
      ],
    );
  }
}
