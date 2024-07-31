import 'package:flutter/material.dart';
import 'package:myapp/components/pressure_content.dart';
import 'package:myapp/components/tyre_content.dart';
import 'package:myapp/model/temp.dart';

class TyreDetails extends StatelessWidget {
  const TyreDetails({super.key, required this.contentOrder,required this.tyreDetails});


 final bool contentOrder;
 final TyrePsi tyreDetails;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(8.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            contentOrder ?
            PressureContent(): TyreContent(tyreDetails: tyreDetails,),
          Spacer(),
            contentOrder ?
            TyreContent(tyreDetails: tyreDetails,) :PressureContent(),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
