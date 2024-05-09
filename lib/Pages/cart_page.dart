import 'package:flutter/material.dart';
import 'package:my_shop/Models/product.dart';
import 'package:my_shop/Models/shop.dart';
import 'package:my_shop/components/myButton.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';

class cart_page extends StatelessWidget {
  const cart_page({super.key});

  void removeFromCart(BuildContext context, product my_product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Want to remove this itm in cart"),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<Shop>().removeFromCart(my_product);
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

  //Pay button methode

  void pay_button(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content:
                  Text("User Wants to pay ! This app is not connect with bank"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page"),
      ),
      drawer: my_drawer(),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text("The cart is empty"),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                          item.price.toString(),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => removeFromCart(context, cart[index]),
                        ),
                      );
                    },
                  ),
          ),

          //PayButton
          my_button(
            ontap: () => pay_button(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Pay Now"),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.wallet),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
