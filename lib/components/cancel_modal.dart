import 'package:drag_drop/pages/home_page.dart';
import 'package:flutter/material.dart';

Future<String?> cancelModal(context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  height: 150,
                  width: 200,
                ),
                Image.asset(
                  'assets/stop.png',
                  height: 120,
                  fit: BoxFit.fill,
                )
              ],
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Are you sure you want to cancel the game?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 15,
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/play_again.png',
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Resume'),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 15,
                      )),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Home();
                    }));
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/cancel.png',
                        height: 45,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Cancel'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
