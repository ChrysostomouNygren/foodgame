import 'package:drag_drop/components/build_ingredient.dart';
import 'package:drag_drop/components/build_instructions.dart';
import 'package:flutter/material.dart';

Widget _buildRecipe(img, ingredients, instructions) {
  return Column(
    children: [
      const SizedBox(
        height: 90,
      ),
      Expanded(child: Image.asset(img)),
      const SizedBox(
        height: 90,
      ),
      Expanded(flex: 1, child: ingredients),
      const SizedBox(
        height: 5,
      ),
      Expanded(flex: 1, child: instructions)
    ],
  );
}

class Oatmeal extends StatelessWidget {
  const Oatmeal({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildRecipe('assets/oatmeal.png', buildOatmealIngredients(),
        buildOatmealInstructions());
  }
}

class VeggieSoup extends StatelessWidget {
  const VeggieSoup({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildRecipe('assets/veggie_soup.png', buildVeggieSoupIngredients(),
        buildVeggieSoupInstructions());
  }
}

class GreekSalad extends StatelessWidget {
  const GreekSalad({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildRecipe('assets/greek_salad.png', buildGreekSaladIngredients(),
        buildGreekSaladInstructions());
  }
}

class BroccoliSoup extends StatelessWidget {
  const BroccoliSoup({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildRecipe('assets/broccoli_soup.png',
        buildBroccoliSoupIngredients(), buildBroccoliSoupInstructions());
  }
}

class DateSnacks extends StatelessWidget {
  const DateSnacks({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildRecipe('assets/date_snacks.png', buildDateSnacksIngredients(),
        buildDateSnacksInstructions());
  }
}
