import 'package:flutter/material.dart';

import 'product.dart';

class Shop extends ChangeNotifier{
  //shop items
  // ignore: unused_field
  final List<product> _shop = [
    product(
      name: "Product 1",
      description: "Description 1",
      price: 100,
    ),
    product(
      name: "Product 2",
      description: "Description 2",
      price: 200,
    ),
    product(
      name: "Product 3",
      description: "Description 3",
      price: 300,
    ),
    product(
      name: "Product 4",
      description: "Description 4",
      price: 400,
    ),
  ];
  //user cart items
  // ignore: unused_field
  List<product> _cart=[

  ];
  //get product list
  List<product> get shop => _shop;

  //get cart list
  List<product> get cart => _cart;
  //add item
  void addToCart(product item){
    _cart.add(item);
    notifyListeners();
  }
  //remove item
  void removeFromCart(product item){
    _cart.remove(item);
    notifyListeners();
  }
}
