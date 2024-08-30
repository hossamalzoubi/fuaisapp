import 'package:flutter/material.dart';

import '../constant.dart';
import 'appbar.dart';
import 'container1.dart';
import 'container2.dart';

class SelfManagement extends StatelessWidget {
  const SelfManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(text: 'Self-management of inventory'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Operation',
              style: TextStyle(fontSize: 20, color: textColor),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('enterinventory');
            },
            child: const CustomContainer1(
              text1: 'Enter inventory',
              text2: 'Your inventory can be added to\nthe warehouse',
              text3: ' Enter Stock Now',
              icon: Icons.arrow_outward,
              iconColor: greenColor,
              image: 'assets/images/inventory.svg',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomContainer1(
            text1: 'Withdrawal of inventory',
            text2: 'You can withdraw your inventory\nfrom the warehouse',
            text3: ' Withdraw stock now',
            icon: Icons.downhill_skiing_rounded,
            iconColor: redColor,
            image: 'assets/images/money.svg',
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomContainer1(
            text1: 'Transfer inventory',
            text2: 'You can transfer stock from\none warehouse to another',
            text3: ' Transfer Stock Now',
            icon: Icons.moving_rounded,
            iconColor: blueColor,
            image: 'assets/images/transfer.svg',
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 17),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Stocks',
              style: TextStyle(fontSize: 20, color: textColor),
            ),
          ),
          const CustomContainer2(
            text1: 'My Stock (Name warehouse)',
            text2: 'You can withdraw your inventory\nfrom the warehouse',
            text3: ' View Your Stock',
            icon: Icons.remove_red_eye,
            height: 100,
            image: 'assets/images/stock.svg',
          ),
        ]),
      ),
    );
  }
}
