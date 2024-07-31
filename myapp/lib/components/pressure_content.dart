import 'package:flutter/material.dart';

class PressureContent extends StatelessWidget {
  const PressureContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('LOW',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600),),
            // SizedBox(height: 4,),
            Text('PRESSURE',style: TextStyle(fontWeight: FontWeight.w600),)
            ],
          );
  }
}