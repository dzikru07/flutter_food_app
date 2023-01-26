import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/product_models.dart';
import 'package:flutter_food_app/model/sales_models.dart';
import 'package:flutter_food_app/style/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SalesDetailsPage extends StatefulWidget {
  const SalesDetailsPage({super.key});

  @override
  State<SalesDetailsPage> createState() => _SalesDetailsPageState();
}

class _SalesDetailsPageState extends State<SalesDetailsPage> {
  List<SalesModels> salesData = [
    SalesModels("500000", Color(0xffcc3c3c), "week 1", "3"),
    SalesModels("900000", Color(0xff478ccc), "week 2", "1"),
    SalesModels("700000", Color(0xffffaa2c), "week 3", "2"),
    SalesModels("400000", Color(0xffcc3c3c), "week 4", "1"),
  ];

  List<ProductModels> productList = [
    ProductModels(
        "Strawberry cake", "12000", "assets/images/strawberry_cake_big.png"),
    ProductModels(
        "Vegetarian Main", "19000", "assets/images/Vegeratian_main_big.png"),
    ProductModels(
        "Burger Big", "22000", "assets/images/Vegeratian_main_big.png"),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    totalIncome() {
      var sumOrder = 0;

      for (var i = 0; i < salesData.length; i++) {
        sumOrder += int.parse(salesData[i].income.toString());
      }

      return sumOrder;
    }

    String convertToIdr(dynamic number, int decimalDigit) {
      NumberFormat currentFormatter = NumberFormat.currency(
        locale: 'id',
        symbol: "Rp",
        decimalDigits: decimalDigit,
      );
      return currentFormatter.format(number);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff9f9f9),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sales Details",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 2,
                margin: EdgeInsets.fromLTRB(0, 8, 0, 20),
                decoration: BoxDecoration(color: Colors.black),
              ),
              Text(
                "Sales Statistics",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Row(
                children: [
                  Text(
                    convertToIdr(int.parse(totalIncome().toString()), 0),
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "in a month",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: salesData.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 45 *
                                double.parse(salesData[index].value.toString()),
                            width: size.width / 4.7,
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: salesData[index].colorData,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              salesData[index].weekData.toString(),
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                      );
                    })),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Best Sellers",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 15, bottom: 10),
                        height: double.minPositive,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 226, 226, 226)
                                    .withOpacity(0.6),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(productList[index].image.toString()),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productList[index].name.toString(),
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    convertToIdr(
                                        int.parse(productList[index]
                                            .price
                                            .toString()),
                                        0),
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: mainColor),
                child: Text(
                  "monthly report",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
