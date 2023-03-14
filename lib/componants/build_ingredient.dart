import 'package:drag_drop/componants/ingredient_state.dart';
import 'package:flutter/material.dart';
import 'ingredients.dart';

Widget _buildIngredient({
  required Ingredients item,
}) {
  return IngredientItem(
    ingredient: item.ingredient,
    added: item.addedStep,
  );
}

Widget _buildIngredientList(meal) {
  return Container(
    decoration: const BoxDecoration(color: Color.fromRGBO(201, 226, 231, 1)),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 5,
      children: List.generate(meal.length, (index) {
        final item = meal[index];
        return _buildIngredient(item: item);
      }),
    ),
  );
}

Widget buildOatmealIngredients() {
  return _buildIngredientList(oatmealIngredients);
}

Widget buildVeggieSoupIngredients() {
  return _buildIngredientList(veggieSoupIngredients);
}

Widget buildGreekSaladIngredients() {
  return _buildIngredientList(greekSaladIngredients);
}
