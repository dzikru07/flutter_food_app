import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/sales_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/product_model.dart';
import '../style/color.dart';

class SalesDetailsPage extends StatefulWidget {
  const SalesDetailsPage({super.key});

  @override
  State<SalesDetailsPage> createState() => _SalesDetailsPageState();
}

class _SalesDetailsPageState extends State<SalesDetailsPage> {
  List<SalesModel> salesData = [
    SalesModel("500000", Color(0xffCC3C3C), "week 1", "3"),
    SalesModel("900000", Color(0xff478CCC), "week 2", "1"),
    SalesModel("700000", Color(0xffFFAA2C), "week 3", "2"),
    SalesModel("400000", Color(0xffCC3C3C), "week 4", "1")
  ];

  List<ProductModel> productList = [
    ProductModel(
        "Straberry Cake", "12000", "assets/images/strawberry_cake_big.png"),
    ProductModel(
        "Vegetarians Main", "19000", "assets/images/Vegeratian_main_big.png"),
    ProductModel(
        "Burger Big", "22000", "assets/images/strawberry_cake_big.png"),
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

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sales Details",
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                height: 2,
                margin: EdgeInsets.fromLTRB(0, 8, 0, 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Text(
                'Sales Statistics',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              Row(
                children: [
                  Text(
                    "Rp. ${totalIncome()}",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'in a month',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: salesData.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 40 *
                                  double.parse(
                                      salesData[index].value.toString()),
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
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ))
                          ],
                        );
                      }))),
              SizedBox(
                height: 20,
              ),
              Text(
                "Best Sellers",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productList.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 15),
                          height: double.minPositive,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Rp. ${productList[index].price.toString()}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }))),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: mainColor),
                  child: Text(
                    "monthly report",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
