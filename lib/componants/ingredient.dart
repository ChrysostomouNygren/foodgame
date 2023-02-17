import 'package:flutter/material.dart';
import 'ingredient_list.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
    this.ingredient = '',
    required this.added,
  });
  final String ingredient;
  final bool added;

// ***********************************************************
// checkboxes pls
// ***********************************************************

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.amber),
            child: Text(ingredient)));
  }
}

Widget _buildIngredientList() {
  return ListView.separated(
    padding: const EdgeInsets.all(100.0),
    itemCount: oatmeal.length,
    separatorBuilder: (context, index) {
      return const SizedBox(
        height: 12.0,
      );
    },
    itemBuilder: (context, index) {
      final item = oatmeal[index];
      return _buildMenuItem(
        item: item,
      );
    },
  );
}

Widget _buildMenuItem({
  required IngredientItem item,
}) {
  return IngredientItem(
    ingredient: item.ingredient,
    added: item.added,
  );
}

Widget buildOatmeal() {
  return _buildIngredientList();
}
