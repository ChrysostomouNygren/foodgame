import 'package:drag_drop/pages/game_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ExampleDragAndDrop();
            }));
          },
          child: const Text('Play'),
        ),
      ),
    );
  }
}
