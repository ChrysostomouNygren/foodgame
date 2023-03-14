import 'package:flutter/material.dart';

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
        Theme(
          data: Theme.of(context).copyWith(
              unselectedWidgetColor: const Color.fromARGB(255, 3, 39, 52)),
          child: Checkbox(
            value: widget.added,
            onChanged: (bool? value) {
              setState(() {
                widget.added = value!;
              });
            },
            activeColor: const Color.fromARGB(255, 3, 39, 52),
            checkColor: Colors.white,
          ),
        ),
        // ändra typsnittsstorlek
        Flexible(child: Text(widget.ingredient)),
      ],
    ));
  }

  void checkBoxChanged(bool? value, int index) {}
}
