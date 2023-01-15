import 'package:flutter/material.dart';
import 'package:flutter_food_app/style/color.dart';

import 'content/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorTheme,
      ),
      home: OrderPage(),
    );
  }
}
