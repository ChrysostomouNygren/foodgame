import 'package:drag_drop/componants/ingredient.dart';
import 'package:drag_drop/componants/instructions.dart';
import 'package:flutter/material.dart';

List<Instructions> oatmealSteps = [
  Instructions(instruction: 'Mix water, oatmeal and salt.', addedStep: false),
  Instructions(
      instruction: 'Bring to the boil and simmer for a couple of minutes.',
      addedStep: false),
  Instructions(
      instruction: 'Serve with milk and condiment of your choice.',
      addedStep: false)
];

class RecipeSteps extends StatefulWidget {
  RecipeSteps({super.key, this.instruction = '', required this.addedStep});
  final String instruction;
  bool addedStep;

  @override
  State<RecipeSteps> createState() => _RecipeStepState();
}

class _RecipeStepState extends State<RecipeSteps> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.amber),
        child: Row(children: [
          Checkbox(
            value: widget.addedStep,
            onChanged: (bool? value) {
              setState(() {
                widget.addedStep = value!;
              });
            },
            activeColor: Colors.black,
          ),
          Text(widget.instruction)
        ]),
      ),
    );
  }
}

Widget _buildOeatmealStepList() {
  return ListView.separated(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      final item = oatmealSteps[index];
      return _buildMenuStep(item: item);
    },
    separatorBuilder: (context, index) {
      return const SizedBox(
        height: 12.0,
      );
    },
    itemCount: oatmealSteps.length,
  );
}

Widget _buildMenuStep({
  required Instructions item,
}) {
  return IngredientItem(
    added: item.addedStep,
    ingredient: item.instruction,
  );
}

Widget buildOatmealInstructions() {
  return _buildOeatmealStepList();
}
