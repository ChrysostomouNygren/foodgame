import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
    this.ingredient = '',
  });
  final String ingredient;

  @override
  Widget build(BuildContext context) {
    return Text(ingredient);
  }
}
