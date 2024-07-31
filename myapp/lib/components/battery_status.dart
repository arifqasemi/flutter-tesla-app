import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
   BatteryStatus({super.key,});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 50,),
        Text(
          "220 mi",
          style: TextStyle(fontSize: 30),
       
        ),
        Text(
          "62%",
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 455),
        Text(
          "Charging",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "18 min remaining",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 99),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("22 mi/hr"),
                Text("232 v"),
              ],
            ),
          ),
        ),
      ],
    );;
  }
}