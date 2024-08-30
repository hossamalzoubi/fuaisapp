import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_managemen_fuais/components/appbar.dart';
import 'package:inventory_managemen_fuais/components/container3.dart';
import 'package:inventory_managemen_fuais/constant.dart';
import 'package:inventory_managemen_fuais/models/productinformation.dart';

class EnterInventory extends StatefulWidget {
  const EnterInventory({super.key});

  @override
  State<EnterInventory> createState() => _EnterInventoryState();
}

class _EnterInventoryState extends State<EnterInventory> {
  CollectionReference productInformation =
      FirebaseFirestore.instance.collection('productInformation');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(text: 'Enter inventory'),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.filter_list_rounded,
              color: textColor,
              size: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('addstock');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: textColor,
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text('Add Stock',
                    style: TextStyle(
                        color: whiteColor, fontWeight: FontWeight.bold)))
          ],
        ),
        StreamBuilder<QuerySnapshot>(
          stream: productInformation
              .where('userId',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  /*
          return Container3(
            details: Details(
              text: snapshot.data!.docs[index]['name'],
              image: snapshot.data!.docs[index]['image'],
              weight: snapshot.data!.docs[index]['weight'],
              id: snapshot.data!.docs[index]['id'],
            ),
          );
          */
                  return CustomContainer3(
                      productInformation: ProductInformation(
                          name: snapshot.data!.docs[index]['name'],
                          weight: snapshot.data!.docs[index]['weight'],
                          id: snapshot.data!.docs[index]['id'],
                          image: snapshot.data!.docs[index]['imageUrl']));
                },
              ),
            );
          },
        )
      ]),
    );
  }
}
