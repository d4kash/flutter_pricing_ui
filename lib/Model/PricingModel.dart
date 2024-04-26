// To parse this JSON data, do
//
//     final pricingModal = pricingModalFromJson(jsonString);

import 'dart:convert';

List<PricingModal> pricingModalFromJson(String str) => List<PricingModal>.from(
    json.decode(str).map((x) => PricingModal.fromJson(x)));

String pricingModalToJson(List<PricingModal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PricingModal {
  String category;

  CategoryData categoryData;
  String price;
  String threeMonthPrice;

  PricingModal({
    required this.category,
    required this.categoryData,
    required this.price,
    required this.threeMonthPrice,
  });

  factory PricingModal.fromJson(Map<String, dynamic> json) => PricingModal(
        category: json["category"],
        categoryData: CategoryData.fromJson(json["categoryData"]),
        price: json["price"],
        threeMonthPrice: json["threeMonthPrice"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "categoryData": categoryData.toJson(),
        "price": price,
        "threeMonthPrice": threeMonthPrice,
      };
}

class CategoryData {
  String body;
  List<String> data;

  CategoryData({
    required this.body,
    required this.data,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        body: json["body"],
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "body": body,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
