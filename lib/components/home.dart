import 'package:flutter/material.dart';

import 'package:inventory_managemen_fuais/constant.dart';

import 'appbar.dart';
import 'container1.dart';
import 'container2.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(text: 'Home'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Inventory',
              style: TextStyle(fontSize: 20, color: textColor),
            ),
          ),
          const CustomContainer1(
            text1: 'Self-management of inventory',
            text2: 'You can enter, withdraw and transfer\nthe inventory alone',
            text3: ' Control Panel',
            image: 'assets/images/self-management.svg',
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomContainer1(
            text1: 'Call Customer care',
            text2: 'You can add your inventory through\nCustomer care',
            text3: ' call now',
            icon: Icons.phone,
            image: 'assets/images/call-customer.svg',
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Monitoring',
              style: TextStyle(fontSize: 20, color: textColor),
            ),
          ),
          const CustomContainer2(
            text1: 'Stock monitoring',
            text2: 'Analyses of your inventory\ncan be found',
            text3: ' View',
            icon: Icons.phone,
            image: 'assets/images/report.svg',
          ),
        ]),
      ),
    );
  }
}
