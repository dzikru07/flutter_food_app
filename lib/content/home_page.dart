import 'package:flutter/material.dart';
import 'package:flutter_food_app/content/sales_details.dart';
import 'package:flutter_food_app/model/product_model.dart';
import 'package:flutter_food_app/style/color.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController searchBar = TextEditingController();

  List<ProductModel> productList = [
    ProductModel(
        "Straberry Cake", "12000", "assets/images/strawberry_cake.png"),
    ProductModel(
        "Pizza Mozarella", "16000", "assets/images/pizza_mozarella.png"),
    ProductModel(
        "Vegetarians Main", "19000", "assets/images/Vegeratian_main.png"),
    ProductModel("Burger Big", "22000", "assets/images/burger_big.png"),
    ProductModel(
        "Vegetarian Comp", "17000", "assets/images/Vegeratian_comp.png"),
  ];

  late List<ProductModel> productAdd = [];

  late List<ProductModel> searchData = [];

  @override
  void initState() {
    super.initState();
    searchData = productList;
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
      backgroundColor: Color(0xffF9F9F9),
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
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
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
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: searchBar,
                    onChanged: ((value) {
                      value = value.toLowerCase();
                      setState(() {
                        searchData = productList.where((data) {
                          var dataProd = data.name!.toLowerCase();
                          return dataProd.contains(value);
                        }).toList();
                      });
                    }),
                    decoration: InputDecoration(
                        hintText: "Search Product",
                        hintStyle: GoogleFonts.poppins(
                            color: Color(0xffCECECE),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/logo/search.png",
                            scale: 2.0,
                          ),
                        ),
                        border: InputBorder.none),
                  ),
                ),
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
                              bottom: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          )),
                        ),
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
                                                  color: Color(0xff78F858),
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
                                                // print(data);
                                              });
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2)),
                                                child: Text(
                                                  "REMOVE",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                          ),
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black87),
                                    ),
                                    Text(
                                      "Rp. ${searchData[index].price.toString()}",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  productAdd.add(ProductModel(
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
                    }))),
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
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Rp. ${totalOrder().toString()}",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      )
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
