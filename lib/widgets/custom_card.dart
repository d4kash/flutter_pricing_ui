import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pricing_ui/Constants/constant.dart';
import 'package:flutter_pricing_ui/Screens/page_pricing_detail.dart';
import 'package:flutter_pricing_ui/widgets/custom_button.dart';
import 'package:flutter_pricing_ui/widgets/custom_subtitle.dart';

class CustomCard extends StatelessWidget {
  final String category;
  final Icon icon;
  final String categoryData;
  final String price;
  final String threeMonthPrice;
  final int selectedChip;
  const CustomCard(
      {super.key,
      required this.category,
      required this.icon,
      required this.categoryData,
      required this.price,
      required this.threeMonthPrice,
      required this.selectedChip});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = {
      "category": category,
      "icon": icon,
      "categoryData": categoryData,
      "price": selectedChip == 0 ? price : threeMonthPrice,
      "threeMonthPrice": threeMonthPrice,
      "selectedChip": selectedChip
    };
    return SizedBox(
        height: Constant.height / 3.2,
        width: Constant.width / 1.05,
        child: Card(
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(top: Constant.height / 30),
            child: Column(
              children: [
                ListTile(
                  leading: icon,
                  title: Text(
                    category,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomSubtitle(
                      categoryData: categoryData,
                    ),
                  ),
                  trailing: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: selectedChip == 0
                              ? "\u{20B9}$price"
                              : "\u{20B9}$threeMonthPrice",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: selectedChip == 0
                              ? '\nPer Month'
                              : '\nPer 3 Months',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey))
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                // 10 days Refund Policy
                Padding(
                    padding: EdgeInsets.only(left: Constant.width / 20),
                    child: selectedChip != 0
                        ? const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("10 days Refund Policy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          )
                        : null),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: Constant.height / 15,
                        width: Constant.width / 3.2,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              // primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PricingDetails(
                                            map: map,
                                          )));
                            },
                            child: const Text("Know more")),
                      ),
                      CustomButton(
                        mapData: map,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
