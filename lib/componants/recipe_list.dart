import 'package:drag_drop/componants/ingredient.dart';
import 'package:flutter/material.dart';
import 'ingredient_list.dart';

class RecipeIngredients extends StatefulWidget {
  RecipeIngredients({
    super.key,
    this.step = '',
    required this.added,
    this.onChanged,
  });
  final String step;
  bool added;
  Function(bool?)? onChanged;

  @override
  State<RecipeIngredients> createState() => _RecipeIngredientState();
}

class _RecipeIngredientState extends State<RecipeIngredients> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.amber),
            child: Row(
              children: [
                Checkbox(
                  value: widget.added,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.added = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
              ],
            )));
  }

  void checkBoxChanged(bool? value, int index) {}
}

Widget _buildIngredientList() {
  return ListView.separated(
    padding: const EdgeInsets.all(100.0),
    itemCount: oatmealIngredients.length,
    separatorBuilder: (context, index) {
      return const SizedBox(
        height: 12.0,
      );
    },
    itemBuilder: (context, index) {
      final item = oatmealIngredients[index];
      return _buildMenuItem(item: item);
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

Widget buildOatmealIngredients() {
  return _buildIngredientList();
}