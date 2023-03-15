import 'package:drag_drop/components/back_btn.dart';
import 'package:drag_drop/components/build_recipes.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key, required this.id, required this.name})
      : super(key: key);

  final int id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(name),
      body: _renderRecipe(id),
    );
  }
}

_renderRecipe(id) {
  if (id == 0) {
    return const Oatmeal();
  } else if (id == 1) {
    return const VeggieSoup();
  } else if (id == 2) {
    return const GreekSalad();
  } else if (id == 3) {
    return const BroccoliSoup();
  } else if (id == 4) {
    return const DateSnacks();
  } else {
    return const Text('error');
  }
}

PreferredSizeWidget _buildAppBar(name) {
  return AppBar(
    iconTheme: const IconThemeData(color: Color.fromARGB(166, 247, 247, 247)),
    leading: const BackBtn(),
    title: Text(name,
        style: const TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 3, 39, 52),
          fontWeight: FontWeight.bold,
        )),
    backgroundColor: const Color.fromARGB(255, 247, 247, 247),
    elevation: 5,
    toolbarHeight: 120,
  );
}
