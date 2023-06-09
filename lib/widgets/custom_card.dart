import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pricing_ui/Constants/constant.dart';
import 'package:flutter_pricing_ui/Screens/page_pricing_detail.dart';
import 'package:flutter_pricing_ui/widgets/custom_button.dart';
import 'package:flutter_pricing_ui/widgets/custom_subtitle.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final String category;

  final List<String> categoryData;
  final String categoryBody;
  final String price;
  final String threeMonthPrice;
  final int selectedChip;
  const CustomCard(
      {super.key,
      required this.category,
      required this.categoryData,
      required this.price,
      required this.threeMonthPrice,
      required this.selectedChip,
      required this.categoryBody});

  @override
  Widget build(BuildContext context) {
    // print(price);
    Map<String, dynamic> map = {
      "category": category,
      "categoryData": categoryData,
      "price": selectedChip == 0 ? price : threeMonthPrice,
      "threeMonthPrice": threeMonthPrice,
      "selectedChip": selectedChip
    };
    return SizedBox(
        height: selectedChip == 0 ? Constant.height / 3.2 : Constant.height / 3,
        width: Constant.width / 1.05,
        child: Card(
          shape: ContinuousRectangleBorder(
            side: BorderSide(
              color: Colors.deepPurpleAccent, //<-- SEE HERE
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(top: Constant.height / 30),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(CarbonIcons.ai_status),
                  title: Text(
                    category,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomSubtitle(
                      categoryData: categoryBody,
                    ),
                  ),
                  trailing: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: selectedChip == 0
                              ? "\u{20B9}$price"
                              : "\u{20B9}$threeMonthPrice",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
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
                            onPressed: () => openDialog(map),
                            // ()
                            // {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => PricingDetails(
                            //                 map: map,
                            //               )));
                            // },
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

  void openDialog(Map<String, dynamic> map) {
    // print(map['categoryData'].length);
    Get.dialog(
      AlertDialog(
        title: Text(map['category']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: Constant.height / 2.5,
              width: Constant.width / 1.2,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: map['categoryData'].length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomSubtitle(
                        categoryData: map['categoryData'][index],
                      ),
                    );
                  })),
            ),
            map['selectedChip'] == 1
                ? const Text(
                    "10 days Refund Policy",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                : Container()
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
