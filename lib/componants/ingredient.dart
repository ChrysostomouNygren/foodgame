import 'package:flutter/material.dart';
import 'ingredient_list.dart';

class IngredientItem extends StatefulWidget {
  IngredientItem({
    super.key,
    this.ingredient = '',
    required this.added,
    this.onChanged,
  });
  final String ingredient;
  bool added;
  Function(bool?)? onChanged;

  @override
  State<IngredientItem> createState() => _IngredientItemState();
}

class _IngredientItemState extends State<IngredientItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        Flexible(child: Text(widget.ingredient)),
      ],
    ));
  }

  void checkBoxChanged(bool? value, int index) {}
}

Widget _buildOatmealIngredientList() {
  return ListView.separated(
    shrinkWrap: true,
    padding: const EdgeInsets.all(100.0),
    itemCount: oatmealIngredients.length,
    separatorBuilder: (context, index) {
      return const SizedBox(
        height: 12.0,
      );
    },
    itemBuilder: (context, index) {
      final item = oatmealIngredients[index];
      return _buildMenuItem(
        item: item,
      );
    },
  );
}

Widget _buildVegetableIngredientList() {
  return ListView.separated(
    shrinkWrap: true,
    padding: const EdgeInsets.all(100.0),
    itemCount: veggieSoupIngredients.length,
    separatorBuilder: (context, index) {
      return const SizedBox(
        height: 12.0,
      );
    },
    itemBuilder: (context, index) {
      final item = veggieSoupIngredients[index];
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
  return _buildOatmealIngredientList();
}

Widget buildVeggieSoup() {
  return _buildVegetableIngredientList();
}
