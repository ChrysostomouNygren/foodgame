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

Widget _buildInstructionList(meal) {
  return Container(
    decoration: const BoxDecoration(color: Color.fromRGBO(141, 185, 194, 1)),
    child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          final item = meal[index];
          return _buildInstruction(item: item);
        }),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: meal.length),
  );
}

Widget buildOatmealInstructions() {
  return _buildInstructionList(oatmealSteps);
}

Widget buildVeggieSoupInstructions() {
  return _buildInstructionList(veggieSoupSteps);
}

Widget buildGreekSaladInstructions() {
  return _buildInstructionList(greekSaladSteps);
}

Widget buildBroccoliSoupInstructions() {
  return _buildInstructionList(broccoliSoupSteps);
}
