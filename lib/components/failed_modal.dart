import 'package:drag_drop/components/back_to_start_btn.dart';
import 'package:drag_drop/pages/home_page.dart';
import 'package:flutter/material.dart';

Future<String?> failedModal(context, name, comment, errors) {
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
                  'assets/images/stop.png',
                  height: 120,
                  fit: BoxFit.fill,
                )
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: [
                    errors == 1
                        ? Text(
                            'Only $errors try left!',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          )
                        : Text(
                            '$errors tries left',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                    Text(
                      "$name",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('$comment',
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
                    'assets/images/play_again.png',
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Try again'),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
