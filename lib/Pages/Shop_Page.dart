import 'package:flutter/material.dart';
import 'package:my_shop/Models/shop.dart';
import 'package:my_shop/components/my_drawer.dart';
import 'package:my_shop/components/my_product_tile.dart';
import 'package:provider/provider.dart';


class shop_page extends StatelessWidget {
  const shop_page({super.key});

  @override
  Widget build(BuildContext context) {
    //acess products
    // ignore: unused_local_variable
    final my_product = context.watch<Shop>().shop;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Shop Page"),
      ),
      drawer: my_drawer(),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Pick from a selected list of premium product",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
          ),
          SizedBox(height: 25,),
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: my_product.length,
              itemBuilder: (context, index) {
                final product = my_product[index];
                return My_product_tile(my_product: product);
              },
            ),
          ),
          SizedBox(height: 20,),
          
        ],
      ),
    );
  }
}
