import 'package:drag_drop/componants/back_btn.dart';
import 'package:drag_drop/componants/steps.dart';
import 'package:flutter/material.dart';
import '../componants/ingredient.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [buildOatmeal(), buildOatmealInstructions()]),
        ),
      ),
      // body: buildOatmeal(),
    );
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
