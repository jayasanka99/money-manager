import 'package:flutter/material.dart';
import 'package:money_app/constant/colors.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.btnColor,
    required this.btnText,
  });

  final Color btnColor;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
          child: Text(
        btnText,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 20),
      )),
    );
  }
}
