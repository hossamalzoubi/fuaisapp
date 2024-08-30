import 'package:flutter/material.dart';

import '../constant.dart';

Future<bool?> showMyDialog(context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Do you want to go BACK?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                'CANCEL',
                style: TextStyle(color: textColor),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'YES',
                style: TextStyle(color: textColor),
              )),
        ],
      );
    },
  );
}
