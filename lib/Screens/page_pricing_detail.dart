import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pricing_ui/Constants/constant.dart';
import 'package:flutter_pricing_ui/Screens/page_pricing.dart';
import 'package:flutter_pricing_ui/Screens/page_thanks.dart';
import 'package:get/get.dart';

class PricingDetails extends StatelessWidget {
  final Map<String, dynamic> map;
  const PricingDetails({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> map = {
    //   "category": "Holistic Care",
    //   "icon": const Icon(CarbonIcons.ai_status),
    //   "categoryData": {
    //     "body":
    //         "Dedicated pediatrician for your baby,\npersonal care plan,\nBest possible baby care",
    //     "data": [
    //       "Dedicated pediatrician for your baby, personal care plan, Best possible baby care",
    //       "Everything included in the PRIME Plan",
    //       "Dedicated pediatrician just for your baby",
    //       "Personalized care plan for your baby and you",
    //       "All Consultations and workshops free*",
    //       "We keep adding new services to provide more value to you"
    //     ]
    //   },
    //   "price": "3998",
    //   "threeMonthPrice": "9999"
    // };
    return SafeArea(
        child: Scaffold(
            // backgroundColor: Constant.backgroundColor,
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
                  Get.offAll(() => const PricingScreen());
                },
              ),
              SizedBox(
                width: Constant.width / 4,
              ),
              const Text(
                "Order Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "My Cart",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ),
          ProductCart(packageName: map['category'], price: map['price']),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 12.0, bottom: 8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Delivery Location",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ),
          const DeliveryLocation(),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 12.0, bottom: 8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Payment Method",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ),
          const PaymentMethod(),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 12.0, bottom: 8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Order Info",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ),
          OrderInfo(
            price: map['price'],
          )
        ],
      ),
    )));
  }
}

class OrderInfo extends StatelessWidget {
  final String price;
  const OrderInfo({Key? key, required this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxBool isLoading = false.obs;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Subtotal",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Text(
                "\u{20B9}$price",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: Constant.height / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Text(
                "\u{20B9}$price",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: Constant.height / 40,
          ),
          Obx(() => SizedBox(
              height: Constant.height / 11,
              width: Constant.width / 1.1,
              child: ElevatedButton(
                  onPressed: () async {
                    isLoading.value = true;
                    await Future.delayed(const Duration(microseconds: 2));
                    isLoading.value = false;
                    Get.to(() => const ThanksPage());
                  },
                  child: isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Checkout",
                          style: TextStyle(fontSize: 18),
                        ))))
        ],
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constant.height / 9,
      width: Constant.width / 1.05,
      child: const Card(
          elevation: 2,
          child: ListTile(
            leading: Icon(
              CarbonIcons.location_current,
              size: 40,
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                "VISA Classic",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "****-4896",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          )),
    );
  }
}

class DeliveryLocation extends StatelessWidget {
  const DeliveryLocation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constant.height / 9,
      width: Constant.width / 1.05,
      child: const Card(
          elevation: 2,
          child: ListTile(
            leading: Icon(
              CarbonIcons.location_current,
              size: 40,
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                "Hazaribagh, Jharkhand",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "825301",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          )),
    );
  }
}

class ProductCart extends StatelessWidget {
  final String packageName;
  final String price;
  const ProductCart({Key? key, required this.packageName, required this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constant.height / 7,
      width: Constant.width / 1.05,
      child: Card(
          elevation: 4,
          child: ListTile(
            leading: Image.network(
                width: 120,
                height: 100,
                'https://babynama.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flogo-new.13630e49.webp&w=1920&q=75',
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return child;
            }, loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
            title: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                packageName,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "\u{20B9}$price",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }
}
