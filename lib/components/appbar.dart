import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    Widget? leading;
    if (text == 'Enter inventory' || text == 'Add Stock') {
      leading = InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          color: textColor,
          size: 20,
        ),
      );
    } else if (text == 'Home') {
      leading = InkWell(
        onTap: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushReplacementNamed('login_page');
        },
        child: const Icon(
          Icons.logout,
          color: textColor,
          size: 20,
        ),
      );
    }
    return AppBar(
      elevation: 0,
      leading: leading,
      backgroundColor: whiteColor,
      centerTitle: true,
      title: Text(
        text,
        style: const TextStyle(color: textColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
