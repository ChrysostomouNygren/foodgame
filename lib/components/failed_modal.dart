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
            const SizedBox(height: 15),
            Image.asset(
              'assets/images/stop.png',
              height: 120,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
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
                          fontSize: 20,
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "$name",
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Text('$comment',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black54,
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
                    height: 5,
                  ),
                  const Text(
                    'Try again',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
