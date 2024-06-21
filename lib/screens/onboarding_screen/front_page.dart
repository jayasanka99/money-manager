import 'package:flutter/material.dart';
import 'package:money_app/constant/colors.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20,),
        const Text(
          "Money Manager",
          style: TextStyle(
            fontSize: 30,
            color: kMainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
