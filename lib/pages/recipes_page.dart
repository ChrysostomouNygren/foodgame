import 'package:flutter/material.dart';

class Recipes extends StatelessWidget {
  const Recipes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Recipes comes here'),
        // TextButton(
        //   onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       return const ExampleDragAndDrop();
        //     }));
        //   },
        //   child: const Text('Play'),
        // ),
      ),
    );
  }
}
