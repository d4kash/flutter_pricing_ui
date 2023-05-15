import 'package:flutter/material.dart';

class PricingDetails extends StatelessWidget {
  final Map<String, dynamic> map;
  const PricingDetails({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Text(map['price']),
    )));
  }
}
