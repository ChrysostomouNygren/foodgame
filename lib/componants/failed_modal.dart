import 'package:flutter/material.dart';

// dialog box when food goes into the wrong bin
Future<String?> failedDialogModal(context) {
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
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/4303/4303935.png',
                  height: 120,
                  fit: BoxFit.fill,
                )
              ],
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "This food isn't going here",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/2550/2550386.png',
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
