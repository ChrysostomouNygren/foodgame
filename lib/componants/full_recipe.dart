import 'package:drag_drop/componants/ingredient.dart';
import 'package:drag_drop/componants/instructions.dart';
import 'package:flutter/material.dart';

class FullRecipe {
  const FullRecipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.uid,
    required this.imageProvider,
  });
  final String name;
  final List<Ingredient> ingredients;
  final List<Instruction> instructions;
  final int uid;
  final ImageProvider imageProvider;
}