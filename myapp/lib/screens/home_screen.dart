import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/components/battery_status.dart';
import 'package:myapp/components/bottom_navigation.dart';
import 'package:myapp/components/current_temp.dart';
import 'package:myapp/components/door_look.dart';
import 'package:myapp/components/temp_degree.dart';
import 'package:myapp/components/temp_detail.dart';
import 'package:myapp/components/tempbtn.dart';
import 'package:myapp/components/test.dart';
import 'package:myapp/components/tyre_details.dart';
import 'package:myapp/components/tyres.dart';
import 'package:myapp/constrian.dart';
import 'package:myapp/controllers/home.dart';
import 'package:myapp/model/temp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _controller = HomeController();

  late AnimationController _batteryAnimationController;
  late AnimationController _tempAnimationController;
  late Animation<double> _batteryAnimation;
  late Animation<double> _animationBatteryStatus;
  late Animation<double> _carShiftAnimation;
  late Animation<double> _tempInfoAnimation;
  late Animation<double> _imageGlowAnimation;
    late AnimationController _tyreAnimationController;
  // We want to animate each tyre one by one
  late Animation<double> _animationTyre1Psi;
  late Animation<double> _animationTyre2Psi;
  late Animation<double> _animationTyre3Psi;
  late Animation<double> _animationTyre4Psi;

  late List<Animation<double>> _tyreAnimations;

  void setBatteryAnimation() {
    _batteryAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _batteryAnimation = CurvedAnimation(
        parent: _batteryAnimationController, curve: const Interval(0.0, 0.5));
    _animationBatteryStatus = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: const Interval(0.6, 1),
    );
  }

  void setTempAnimation() {
    _tempAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _carShiftAnimation = CurvedAnimation(
        parent: _tempAnimationController, curve: const Interval(0.2, 0.4));
    _tempInfoAnimation = CurvedAnimation(
        parent: _tempAnimationController, curve: const Interval(0.45, 0.65));
    _imageGlowAnimation = CurvedAnimation(
        parent: _tempAnimationController, curve: const Interval(0.7, 1));
  }
  void setupTyreAnimation() {
    _tyreAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _animationTyre1Psi = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.34, 0.5));
    _animationTyre2Psi = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.5, 0.66));
    _animationTyre3Psi = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.66, 0.82));
    _animationTyre4Psi = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.82, 1));
    _tyreAnimations = [
      _animationTyre1Psi,
      _animationTyre2Psi,
      _animationTyre3Psi,
      _animationTyre4Psi,
    ];
  }
  @override
  void initState() {
    setBatteryAnimation();
     setupTyreAnimation();
  setTempAnimation();   
    super.initState();
    
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    _tempAnimationController.dispose();
    _tyreAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([
          _controller,
          _batteryAnimationController,
          _tempAnimationController,
          _tyreAnimationController
        ]),
        builder: (context, snapshot) {
          return SafeArea(
            child: Scaffold(
              bottomNavigationBar: BottomNavigation(
                  controller: _controller,
                  onTap: (index) {
                    if (index == 1) {
                      _batteryAnimationController.forward();
                    } else {
                      _batteryAnimationController.reverse();
                    }
                    if (index == 2) {
                      _tempAnimationController.forward();
                    } else if (_controller.selectedBottomTab == 2 &&
                        index != 2) {
                      _tempAnimationController.reverse(from: 0.4);
                    }
                    if(index == 3){
                      _tyreAnimationController.forward();
                    }else if(_controller.selectedBottomTab == 3 && index !=3){
                      _tyreAnimationController.reverse();
                    }
                    _controller.updateTypeController(index);
                    _controller.updateTyreController(index);

                    _controller.updateSelectedBottomTab(index);
                  }),
              body: LayoutBuilder(
                builder: (context, constraints) => Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                    ),
                    Positioned(
                      left: constraints.maxWidth / 2 * _carShiftAnimation.value,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: constraints.maxHeight * 0.1),
                        child: SvgPicture.asset(
                          "assets/icons/Car.svg",
                          width: double.infinity,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: _controller.selectedBottomTab == 0
                          ? constraints.maxWidth * 0.05
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLook(
                          islocked: _controller.isRightDoorLocked,
                          press: _controller.updateRightDoorLocked,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      left: _controller.selectedBottomTab == 0
                          ? constraints.maxWidth * 0.05
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLook(
                          islocked: _controller.isLeftDoorLocked,
                          press: _controller.updateLefttDoorLocked,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: _controller.selectedBottomTab == 0
                          ? constraints.maxWidth * 0.3
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLook(
                          islocked: _controller.isTopDoorLocked,
                          press: _controller.updateToptDoorLocked,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: _controller.selectedBottomTab == 0
                          ? constraints.maxWidth * 0.1
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLook(
                          islocked: _controller.isBottomDoorLocked,
                          press: _controller.updateBottomtDoorLocked,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _batteryAnimation.value,
                      child: SvgPicture.asset(
                        'assets/icons/Battery.svg',
                        width: constraints.maxWidth * 0.45,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: -38 * _animationBatteryStatus.value,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _animationBatteryStatus.value,
                        child: BatteryStatus(),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: -38 * _tempInfoAnimation.value,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _tempInfoAnimation.value,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 70),
                              Expanded(
                                flex: 3,
                                child: TempDetail(controller: _controller),
                              ),
                              const Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: TempDegree(),
                                ),
                              ),
                              const Expanded(flex: 1, child: CurrentTemp()),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: -180 * (1 - _imageGlowAnimation.value),
                        child: Test(
                            controller: _controller,
                            temInfoAnimation: _tempInfoAnimation)),
                    if (_controller.tyreController) ...Tyres(constraints),
                    if(_controller.tyreStatusController)
                    GridView.builder(
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: defaultPadding,
                        mainAxisSpacing: defaultPadding,
                        childAspectRatio:
                            constraints.maxWidth / constraints.maxHeight,
                      ),
                      itemBuilder: (context, index) => ScaleTransition(
                        scale: _tyreAnimations[index],
                        child: Container(
                          decoration: BoxDecoration(
                              color: demoPsiList[index].isLowPressure ? redColor.withOpacity(0.1) : Colors.white10,
                              border: Border.all(color: demoPsiList[index].isLowPressure ? redColor : primaryColor, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(6))),
                          child:  TyreDetails(contentOrder: index > 1,tyreDetails: demoPsiList[index],),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

List<String> navSr = [
  'assets/icons/Lock.svg',
  'assets/icons/Charge.svg',
  'assets/icons/Temp.svg',
  'assets/icons/Tyre.svg'
];
