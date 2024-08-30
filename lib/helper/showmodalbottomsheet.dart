import 'package:flutter/material.dart';

import '../constant.dart';

void customModalBottomSheet(BuildContext context, String text) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
          color: textColor,
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: whiteColor, fontSize: 15),
          ));
    },
  );
}
