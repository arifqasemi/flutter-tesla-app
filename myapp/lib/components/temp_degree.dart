import 'package:flutter/material.dart';

class TempDegree extends StatefulWidget {
  const TempDegree({super.key});

  @override
  State<TempDegree> createState() => _TempDegreeState();
}

class _TempDegreeState extends State<TempDegree> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(bottom: 0),
      child:  Column(
        children: [
          Column(
            children: [
              Icon(
                Icons.arrow_drop_up,
                size: 46,
              ),
              // SizedBox(height: 50,),
               Text(
            "29" + "\u2103",
            style: TextStyle(fontSize: 86),
          ),
          Icon(
            Icons.arrow_drop_up,
            size: 46,
          ),
            ],
          ),
       
        ],
      ),
    );
  }
}
