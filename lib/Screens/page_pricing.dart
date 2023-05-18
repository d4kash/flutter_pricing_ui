import 'dart:convert';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pricing_ui/Constants/constant.dart';
import 'package:flutter_pricing_ui/Model/PricingModel.dart';
import 'package:flutter_pricing_ui/widgets/custom_card.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PricingScreen extends StatelessWidget {
  const PricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late RxList<dynamic> pricingdata = [].obs;
    RxInt chipValue = 0.obs;
    List monthList = ["1 Month", "3 Months"];
    List<Map<String, dynamic>> pricingData = [
      {
        "category": "Basic Care",
        "categoryData": {
          "body": "Pediatric care in 15 minutes",
          "data": [
            "Pediatric care in 15 minutes",
            "Instant chat with pediatricians on WhatsApp",
            "Free pediatrician consultations (day)",
            "Live Yoga Sessions"
          ]
        },
        "price": "999",
        "threeMonthPrice": "2499"
      },
      {
        "category": "Prime Care",
        "categoryData": {
          "body":
              "Pediatric care in 15 minutes, lactation,\nnutrition, monthly milestones,\nemergency support",
          "data": [
            "Pediatric care in 15 minutes, lactation, nutrition, monthly milestones, emergency support",
            "Everything in Basic Care",
            "24x7 free pediatrician consultations",
            "Monthly growth and milestones tracking by pediatrician",
            "Lactation and Weaning Support"
          ]
        },
        "price": "1999",
        "threeMonthPrice": "4999"
      },
      {
        "category": "Holistic Care",
        "categoryData": {
          "body":
              "Dedicated pediatrician for your baby,\npersonal care plan,\nBest possible baby care",
          "data": [
            "Dedicated pediatrician for your baby, personal care plan, Best possible baby care",
            "Everything included in the PRIME Plan",
            "Dedicated pediatrician just for your baby",
            "Personalized care plan for your baby and you",
            "All Consultations and workshops free*",
            "We keep adding new services to provide more value to you"
          ]
        },
        "price": "3998",
        "threeMonthPrice": "9999"
      }
    ];

    Future<String> loadData() async {
      var data = await rootBundle.loadString("assets/pricing_data.json");
      // setState(() {
      pricingdata.value = json.decode(data);
      // });
      return "success";
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: Constant.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Obx(() => SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics())),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Constant.height / 15,
                  ),
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Our Care Plans",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          // list of length 3
                          children: List.generate(
                            2,
                            (int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChip(
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  // side: const BorderSide(),

                                  padding: const EdgeInsets.all(8),
                                  label: Text(monthList[index],
                                      style: const TextStyle(fontSize: 18)),
                                  // color of selected chip
                                  selectedColor: Colors.blue,
                                  backgroundColor: Colors.white,
                                  // selected chip value
                                  selected: chipValue.value == index,
                                  // onselected method
                                  onSelected: (bool selected) {
                                    chipValue.value =
                                        (selected ? index : null)!;
                                  },
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Constant.height / 30,
                  ),
                  SizedBox(
                      child: FutureBuilder(
                          future: loadData(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Obx(() => ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: pricingdata.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      try {
                                        var encodedString =
                                            json.encode(pricingdata);
                                        var modalData =
                                            pricingModalFromJson(encodedString);
                                        // print(modalData[index].category);

                                        return CustomCard(
                                          category: modalData[index].category,
                                          categoryBody: modalData[index]
                                              .categoryData
                                              .body,
                                          price: modalData[index].price,
                                          threeMonthPrice:
                                              modalData[index].threeMonthPrice,
                                          selectedChip: chipValue.value,
                                          categoryData: modalData[index]
                                              .categoryData
                                              .data,
                                        );
                                      } on Exception catch (e) {
                                        // TODO
                                      }
                                    },
                                  ));
                            } else {
                              return Container();
                            }
                          })),
                ],
              ),
            )),
      ),
    ));
  }
}
