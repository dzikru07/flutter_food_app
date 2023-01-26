import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_food_app/content/sales_details.dart';
import 'package:flutter_food_app/model/product_models.dart';
import 'package:flutter_food_app/style/color.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController searchBar = TextEditingController();

  List<ProductModels> productList = [
    ProductModels(
        "Straberry Cake", "1200", "assets/images/strawberry_cake.png"),
    ProductModels(
        "Pizza Mozarella", "1600", "assets/images/pizza_mozarella.png"),
    ProductModels(
        "Vegetarians Main", "1900", "assets/images/Vegeratian_main.png"),
    ProductModels("Burger Big", "2200", "assets/images/burger_big.png"),
    ProductModels(
        "Vegetarian Comp", "1700", "assets/images/Vegeratian_main.png"),
  ];

  late List<ProductModels> productAdd = [];

  late List<ProductModels> searchData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchData = productList;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchBar.dispose();
  }

  @override
  Widget build(BuildContext context) {
    totalOrder() {
      var sumOrder = 0;

      for (var i = 0; i < productAdd.length; i++) {
        sumOrder += int.parse(productAdd[i].price.toString());
      }

      return sumOrder;
    }

    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      appBar: AppBar(
        title: Text(
          "Detail Order",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 199, 199, 199).withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: searchBar,
                    onChanged: (value) {
                      value = value.toLowerCase();
                      setState(() {
                        searchData = productList.where((data) {
                          var dataProd = data.name!.toLowerCase();
                          return dataProd.contains(value);
                        }).toList();
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Search Product",
                        hintStyle: GoogleFonts.poppins(
                          color: Color(0xffcecece),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        suffixIcon: Image.asset(
                          "assets/logo/search.png",
                          scale: 2.0,
                        ),
                        border: InputBorder.none),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchData.length,
                  itemBuilder: ((context, index) {
                    var data = productAdd.indexWhere(
                        (element) => element.name == searchData[index].name);
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Image.asset(
                                      searchData[index].image.toString()),
                                  data == -1
                                      ? SizedBox()
                                      : Opacity(
                                          opacity: 0.5,
                                          child: Container(
                                            width: 70,
                                            height: 55,
                                            decoration: BoxDecoration(
                                                color: Color(0xff78f858),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                        ),
                                  data == -1
                                      ? SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              productAdd.removeAt(data);
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                                color: mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            child: Text(
                                              "REMOVE",
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    searchData[index].name.toString(),
                                    style: GoogleFonts.poppins(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Rp. ${searchData[index].price.toString()}",
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                productAdd.add(ProductModels(
                                    searchData[index].name.toString(),
                                    searchData[index].price.toString(),
                                    searchData[index].image.toString()));
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: mainColor,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    );
                  })),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: mainColor,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 177, 177, 177).withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${productAdd.length} item",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Rp. ${totalOrder().toString()}",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SalesDetailsPage())));
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
