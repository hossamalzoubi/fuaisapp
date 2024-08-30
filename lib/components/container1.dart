import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_managemen_fuais/constant.dart';

class CustomContainer1 extends StatelessWidget {
  const CustomContainer1(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      this.iconColor = textColor,
      this.icon = Icons.window_rounded,
      required this.image});
  final String text1;
  final String text2;
  final String text3;
  final String image;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(fontSize: 18, color: textColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(text2,
                      style: const TextStyle(fontSize: 13, color: greyColor)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(icon, color: iconColor, size: 15),
                      Text(text3,
                          style:
                              const TextStyle(fontSize: 15, color: textColor))
                    ],
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              SvgPicture.asset(
                image,
                width: 100,
                height: 100,
              )
            ],
          ),
        ));
  }
}
