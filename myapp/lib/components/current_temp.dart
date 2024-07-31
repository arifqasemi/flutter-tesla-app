import 'package:flutter/material.dart';

class CurrentTemp extends StatelessWidget {
  const CurrentTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('CURRENT TEMPERATURE',style: TextStyle(color: Colors.white),),
        Row(
          children: [
            Column(
              children: [
                Text('INSIDE',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                Text('20' + '\u2103',
                    style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w500))
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  'OUTSIDE',
                  style: TextStyle(color: Color.fromARGB(196, 255, 255, 255)),
                ),
                Text(
                  '35' + '\u2103',
                  style: TextStyle(
                      color: Color.fromARGB(190, 255, 255, 255), fontSize: 20,fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
