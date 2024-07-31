import 'package:flutter/material.dart';
import 'package:myapp/constrian.dart';

class Test extends StatelessWidget {
  const Test(
      {super.key, required this.controller, required this.temInfoAnimation});
  final dynamic controller;
  final dynamic temInfoAnimation;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: temInfoAnimation.value,
      child: AnimatedSwitcher(
        duration: defaultDuration,
        child: controller.isCoolSelected
            ? IgnorePointer(child: Image.asset('assets/images/Cool_glow_2.png',key: UniqueKey(),))
            : IgnorePointer(child: Image.asset('assets/images/Hot_glow_4.png',key: UniqueKey(),)),
      ),
    );
  }
}
