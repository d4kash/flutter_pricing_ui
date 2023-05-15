import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pricing_ui/Constants/constant.dart';
import 'package:flutter_pricing_ui/Screens/page_pricing.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  CarbonIcons.close,
                  size: 35,
                ),
                onPressed: () {
                  Get.offAll(()=> const PricingScreen());
                },
              ),
              SizedBox(
                width: Constant.width / 4,
              ),
              const Text(
                "Thanks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          SizedBox(
            height: Constant.height / 6,
          ),
          const Text(
            "Your Order Purchased Successfully",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Constant.height / 8,
          ),
          Center(child: Lottie.asset('assets/lottie/113967-thank-you.json')),
        ],
      ),
    )));
  }
}
