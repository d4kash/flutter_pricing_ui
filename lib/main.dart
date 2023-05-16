import 'package:flutter/material.dart';
import 'package:flutter_pricing_ui/Screens/page_pricing.dart';
import 'package:flutter_pricing_ui/Screens/page_pricing_detail.dart';
import 'package:flutter_pricing_ui/Screens/page_thanks.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pricing UI',
      theme: ThemeData(
          textTheme: GoogleFonts.firaSansTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ))),
      home: const PricingScreen(),
    );
  }
}
