import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constrian.dart';

class Tempbtn extends StatelessWidget {
  const Tempbtn(
      {super.key,
      required this.title,
      required this.svgSr,
      required this.temColor,
      required this.press,
      required this.isActive});
  final String svgSr, title;
  final Color temColor;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            duration: defaultDuration,
            curve: Curves.easeInOutBack,
            height: isActive ? 76 : 50,
            width: isActive ? 76 : 50,
            child: SvgPicture.asset(
              svgSr,
              color: isActive ? temColor : Colors.white38,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? temColor : Colors.white38,
                fontSize: isActive ? 20 : 15),
              child: Text(title,)
          )
        ],
      ),
    );
  }
}
