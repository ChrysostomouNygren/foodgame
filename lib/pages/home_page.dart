import 'package:drag_drop/pages/game_page.dart';
import 'package:drag_drop/pages/recipes_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
              padding: EdgeInsets.all(40.0),
              child: SizedBox(
                height: 30,
              )),
          Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DragAndDropGame();
                    }));
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          width: 180,
                          height: 180,
                          child: Image.asset('assets/images/play_btn.png')),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Play',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Recipes();
                    }));
                  },
                  child: const Text(
                    'My recipes',
                    style: TextStyle(
                        color: Color.fromARGB(255, 31, 31, 31), fontSize: 20),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
