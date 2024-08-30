import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';

class CustomContainer2 extends StatelessWidget {
  const CustomContainer2(
      {super.key,
      required this.text1,
      required this.text2,
      this.height = 160,
      required this.text3,
      this.icon = Icons.window_rounded,
      required this.image});
  final String text1;
  final String text2;
  final String text3;
  final String image;
  final IconData icon;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: textColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                      fontSize: text1 == 'My Stock (Name warehouse)' ? 16 : 19,
                      color: whiteColor,
                      fontWeight: FontWeight.w500),
                ),
                text1 == 'My Stock (Name warehouse)'
                    ? const SizedBox(
                        height: 5,
                      )
                    : const SizedBox(
                        height: 10,
                      ),
                Text(text2,
                    style: TextStyle(
                        fontSize:
                            text1 == 'My Stock (Name warehouse)' ? 10 : 13,
                        color: greyColor,
                        fontWeight: FontWeight.w500)),
                text1 == 'My Stock (Name warehouse)'
                    ? const SizedBox(
                        height: 5,
                      )
                    : const SizedBox(
                        height: 45,
                      ),
                text1 == 'My Stock (Name warehouse)'
                    ? Row(
                        children: [
                          Icon(icon,
                              color: whiteColor,
                              size: text1 == 'My Stock (Name warehouse)'
                                  ? 13
                                  : 16),
                          Text(text3,
                              style: TextStyle(
                                fontSize: text1 == 'My Stock (Name warehouse)'
                                    ? 13
                                    : 16,
                                color: whiteColor,
                              ))
                        ],
                      )
                    : Row(
                        children: [
                          Text(text3,
                              style: TextStyle(
                                fontSize: text1 == 'My Stock (Name warehouse)'
                                    ? 13
                                    : 16,
                                color: whiteColor,
                              ))
                        ],
                      ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            SvgPicture.asset(
              image,
              width: text1 == 'My Stock (Name warehouse)' ? 90 : 100,
              height: text1 == 'My Stock (Name warehouse)' ? 80 : 100,
            )
          ],
        ));
  }
}
