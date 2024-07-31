import 'package:flutter/material.dart';
import 'package:myapp/components/current_temp.dart';
import 'package:myapp/components/temp_degree.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) => 
        Stack(
        children: [
          Positioned(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            top: 50,
            child:const Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TempDegree(),
                    ),
                  ),
                  const Expanded(child: CurrentTemp()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
