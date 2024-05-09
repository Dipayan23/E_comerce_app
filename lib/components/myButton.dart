import 'package:flutter/material.dart';

// ignore: must_be_immutable
class my_button extends StatelessWidget {
  void Function()? ontap;
  Widget child;
  my_button({super.key,required this.ontap,required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          
        ),
        padding: EdgeInsets.symmetric(horizontal: 75,vertical: 20),
        child: child,
      ),
    );
  }
}