import 'package:flutter/material.dart';
import 'package:my_shop/components/my_drawer_list.dart';

class my_drawer extends StatelessWidget {
  const my_drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.shopping_cart,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          my_drawer_list(
            text: "Shop",
            icon: Icons.home,
            ontap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/shop_page');
            },
          ),
          my_drawer_list(
            text: "Cart",
            icon: Icons.shopping_cart_checkout,
            ontap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cart_page');
            },
          ),
          my_drawer_list(
            text: "Exit",
            icon: Icons.logout,
            ontap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
