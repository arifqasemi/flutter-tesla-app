import 'package:flutter/material.dart';
import 'package:myapp/components/tempbtn.dart';
import 'package:myapp/constrian.dart';

class TempDetail extends StatelessWidget {
  const TempDetail({super.key,required this.controller});

  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Tempbtn(
            isActive: controller.isCoolSelected,
            title: 'COOL',
            svgSr: 'assets/icons/coolShape.svg',
            temColor: primaryColor,
            press: () => controller.updateCoolSelected()),
        const SizedBox(width: 20),
        Tempbtn(
            isActive: !controller.isCoolSelected,
            title: 'HEAT',
            svgSr: 'assets/icons/heatShape.svg',
            temColor: redColor,
            press: () => controller.updateCoolSelected())
      ],
    );
  }
}
