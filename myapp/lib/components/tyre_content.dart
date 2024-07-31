import 'package:flutter/material.dart';
import 'package:myapp/model/temp.dart';

class TyreContent extends StatelessWidget {
  const TyreContent({super.key,required this.tyreDetails});

  final TyrePsi tyreDetails;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text.rich(
                TextSpan(
                  text: '${tyreDetails.psi}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white, fontSize: 26),
                  children: [
                    TextSpan(text: 'psi', style: TextStyle(fontSize: 24)),
                  ],
                  
                ),
              ),
                 Text(
            "${tyreDetails.temp}" + "\u2103",
            style: TextStyle(fontSize: 20),
          )
      ],
    );
  }
}