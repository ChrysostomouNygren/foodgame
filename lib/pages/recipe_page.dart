import 'package:drag_drop/componants/back_btn.dart';
import 'package:drag_drop/componants/ingredient_list.dart';
import 'package:flutter/material.dart';
import '../componants/ingredient.dart';

const List<IngredientItem> _oatmeal = [
  IngredientItem(ingredient: '2 dl Water'),
  IngredientItem(ingredient: '1 dl Oatmeal'),
  IngredientItem(ingredient: 'A pinch of salt')
];

class RecipePage extends StatelessWidget {
  const RecipePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildIngredientList(),
    );
  }
}

Widget _buildIngredientList() {
  return ListView.separated(
    padding: const EdgeInsets.all(100.0),
    itemCount: _oatmeal.length,
    separatorBuilder: (context, index) {
      return const SizedBox(
        height: 12.0,
      );
    },
    itemBuilder: (context, index) {
      final item = _oatmeal[index];
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
  );
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
