import 'package:flutter/material.dart';

// ignore: must_be_immutable
class my_drawer_list extends StatelessWidget {
  final String text;
  final IconData icon;
  void Function()? ontap;

  my_drawer_list({
    super.key,
    required this.text,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(text),
        onTap: ontap,
      ),
    );
  }
}
