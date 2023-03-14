import 'package:drag_drop/componants/instruction_state.dart';
import 'package:drag_drop/componants/instructions.dart';
import 'package:flutter/material.dart';

Widget _buildInstruction({
  required Instructions item,
}) {
  return InstructionItem(
    added: item.addedStep,
    instruction: item.instruction,
  );
}

Widget _buildOatmealStepList() {
  return Container(
    decoration: const BoxDecoration(color: Color.fromRGBO(141, 185, 194, 1)),
    child: ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = oatmealSteps[index];
        return _buildInstruction(item: item);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 1,
        );
      },
      itemCount: oatmealSteps.length,
    ),
  );
}

Widget _buildVeggieSoupStepList() {
  return Container(
    decoration: const BoxDecoration(color: Color.fromRGBO(141, 185, 194, 1)),
    child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = veggieSoupSteps[index];
          return _buildInstruction(item: item);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 1,
          );
        },
        itemCount: veggieSoupSteps.length),
  );
}

Widget _buildGreekSaladStepList() {
  return Container(
    decoration: const BoxDecoration(color: Color.fromRGBO(141, 185, 194, 1)),
    child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          final item = greekSaladSteps[index];
          return _buildInstruction(item: item);
        }),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 1,
          );
        },
        itemCount: greekSaladSteps.length),
  );
}

Widget buildOatmealInstructions() {
  return _buildOatmealStepList();
}

Widget buildVeggieSoupInstructions() {
  return _buildVeggieSoupStepList();
}

Widget buildGreekSaladInstructions() {
  return _buildGreekSaladStepList();
}
