import 'package:flutter/material.dart';
import 'package:money_app/constant/colors.dart';

class SharedOnboarding extends StatelessWidget {
  const SharedOnboarding({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
  });
  final String title;
  final String desc;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, width: 300, height: 300, fit: BoxFit.cover),
        const SizedBox(height: 20),
        Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: kBlack),),
        Text(desc, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal,color: kGrey,),textAlign: TextAlign.center,),
      ],
    );
  }
}
