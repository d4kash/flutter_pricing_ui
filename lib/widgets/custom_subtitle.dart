import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';

class CustomSubtitle extends StatelessWidget {
  final String categoryData;
  const CustomSubtitle({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(
        CarbonIcons.checkmark,
        color: Colors.green,
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Text(
          categoryData,
          // softWrap: true,
          // overflow: TextOverflow.ellipsis,
          // maxLines: 1,
          style: const TextStyle(),
        ),
      )
    ]);
  }
}
