import 'package:flutter/material.dart';
import 'package:inventory_managemen_fuais/constant.dart';
import 'package:inventory_managemen_fuais/models/productinformation.dart';

class CustomContainer3 extends StatelessWidget {
  const CustomContainer3({super.key, required this.productInformation});
  final ProductInformation productInformation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Column 1
            const Spacer(),
            Text(
              productInformation.name,
              style: const TextStyle(
                  fontSize: 20, color: textColor, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Weight: ${productInformation.weight} tons',
              style: const TextStyle(fontSize: 14, color: greyColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'View Details',
              style: TextStyle(fontSize: 16, color: textColor),
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            //Column 2
            const Spacer(),
            Text(
              'Stock ID : ${productInformation.id}',
              style: const TextStyle(fontSize: 14, color: greyColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Icon(
                  Icons.ac_unit_rounded,
                  color: textColor,
                  size: 15,
                ),
                Text(
                  ' Under review',
                  style: TextStyle(fontSize: 15, color: textColor),
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(productInformation.image),
        )
      ]),
    );
  }
}
