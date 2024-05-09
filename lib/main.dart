

import 'package:flutter/material.dart';
import 'package:my_shop/Models/shop.dart';
import 'package:my_shop/Pages/Shop_Page.dart';
import 'package:my_shop/Pages/cart_page.dart';
import 'package:my_shop/Pages/intro_page.dart';
import 'package:my_shop/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightmode,
      debugShowCheckedModeBanner: false,
      home: intro_page(),
      routes: {
        '/intro_page': (context) => intro_page(),
        '/shop_page': (context) => shop_page(),
        '/cart_page': (context) => cart_page(),
      },
    );
  }
}
