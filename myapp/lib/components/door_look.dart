import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constrian.dart';

class DoorLook extends StatefulWidget {
  const DoorLook({super.key, required this.press, required this.islocked});

  final VoidCallback press;
  final bool islocked;

  @override
  State<DoorLook> createState() => _DoorLookState();
}

class _DoorLookState extends State<DoorLook> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.press,
        child: AnimatedSwitcher(
          switchInCurve: Curves.easeInBack,
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          duration: defaultDuration,
          child: widget.islocked
              ? SvgPicture.asset(
                  'assets/icons/door_lock.svg',
                  key: const ValueKey('look'),
                )
              : SvgPicture.asset(
                  'assets/icons/door_unlock.svg',
                  key: const ValueKey('unlook'),
                ),
        ));
  }
}
