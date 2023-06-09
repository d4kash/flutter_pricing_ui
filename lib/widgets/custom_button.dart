import 'package:flutter/material.dart';
import 'package:flutter_pricing_ui/Constants/constant.dart';
import 'package:flutter_pricing_ui/Screens/page_pricing_detail.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final Map<String, dynamic> mapData;
  const CustomButton({super.key, required this.mapData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constant.height / 15,
      width: Constant.width / 2.6,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(
                  color: Colors.teal,
                  width: 2.0,
                ),
              ),
            ),
          ),
          onPressed: () {
            Get.to(() => PricingDetails(
                  map: mapData,
                ));
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => PricingDetails(
            //                 map: mapData,
            //               )));
          },
          child: Row(
            children: [
              Text(
                "Activate this offer",
                style: TextStyle(fontSize: Constant.width / 40),
              ),
              SizedBox(
                width: Constant.width / 52,
              ),
              const Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              )
            ],
          )),
    );
  }
}
