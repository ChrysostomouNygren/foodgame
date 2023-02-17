import 'package:drag_drop/componants/back_btn.dart';
import 'package:drag_drop/componants/back_to_start_btn.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(children: const [Text('data'), Text('data')])
        ],
      ),
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
