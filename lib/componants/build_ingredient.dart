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

Widget _buildOatmealIngredientList() {
  return Container(
    decoration: const BoxDecoration(color: Color.fromRGBO(201, 226, 231, 1)),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 5,
      children: List.generate(oatmealIngredients.length, (index) {
        final item = oatmealIngredients[index];
        return _buildIngredient(item: item);
      }),
    ),
  );
}

Widget _buildVeggieSoupIngredientList() {
  return Container(
    decoration: const BoxDecoration(color: Color.fromRGBO(201, 226, 231, 1)),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 5,
      children: List.generate(veggieSoupIngredients.length, (index) {
        final item = veggieSoupIngredients[index];
        return _buildIngredient(item: item);
      }),
    ),
  );
}

Widget buildOatmealIngredients() {
  return _buildOatmealIngredientList();
}

Widget buildVeggieSoupIngredients() {
  return _buildVeggieSoupIngredientList();
}
