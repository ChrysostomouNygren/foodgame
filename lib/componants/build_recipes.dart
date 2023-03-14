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
        Expanded(
          child: Image.asset('assets/oatmeal.png'),
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
        Expanded(child: Image.asset('assets/veggie_soup.png')),
        const SizedBox(
          height: 90,
        ),
        Expanded(flex: 1, child: buildVeggieSoupIngredients()),
        const SizedBox(
          height: 5,
        ),
        Expanded(flex: 1, child: buildVeggieSoupInstructions())
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
        Expanded(child: Image.asset('assets/greek_salad.png')),
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

class BroccoliSoup extends StatelessWidget {
  const BroccoliSoup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 90.0,
        ),
        Expanded(child: Image.asset('assets/broccoli_soup.png')),
        const SizedBox(
          height: 90,
        ),
        Expanded(
          flex: 1,
          child: buildBroccoliSoupIngredients(),
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          flex: 1,
          child: buildBroccoliSoupInstructions(),
        )
      ],
    );
  }
}
