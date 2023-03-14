import 'package:drag_drop/componants/back_btn.dart';
import 'package:drag_drop/componants/build_recipes.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
  } else {
    return const Text('error');
  }
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    iconTheme: const IconThemeData(color: Color.fromARGB(166, 247, 247, 247)),
    leading: const BackBtn(),
    title: const Text('Recipe name',
        style: TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 3, 39, 52),
          fontWeight: FontWeight.bold,
        )),
    backgroundColor: const Color.fromARGB(255, 247, 247, 247),
    elevation: 5,
    toolbarHeight: 120,
  );
}
