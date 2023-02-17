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
                Text(widget.ingredient),
              ],
            )));
  }

  void checkBoxChanged(bool? value, int index) {}
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
