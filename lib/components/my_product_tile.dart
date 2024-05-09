import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_shop/Models/shop.dart';
import 'package:provider/provider.dart';

import '../Models/product.dart';

class My_product_tile extends StatelessWidget {
  final product my_product;
  My_product_tile({super.key, required this.my_product});

  void addToCart(BuildContext context) {
    //dialog box for confarmation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Want to add this itm in cart"),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<Shop>().addToCart(my_product);
              Navigator.pop(context);
            },
            child: Text("Yes"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Product Shop
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  child: Icon(Icons.favorite),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //Product name
              Text(
                my_product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //Product description
              Text(my_product.description),
            ],
          ),
          //Price+Add Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + my_product.price.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  onPressed: ()=>addToCart(context),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
