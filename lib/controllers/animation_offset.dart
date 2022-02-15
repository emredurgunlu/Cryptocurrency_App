import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationOffset extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController offsetAnimationController;

  late Animation<Offset> offsetAnimation1;
  late Animation<Offset> offsetAnimation2;
  late Animation<Offset> offsetAnimation3;

  @override
  void onInit() {
    super.onInit();

    offsetAnimationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    offsetAnimation1 = Tween<Offset>(
      begin: const Offset(-3, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: offsetAnimationController,
        curve: const Interval(
          0,
          0.5,
          curve: Curves.ease,
        ),
      ),
    );

    offsetAnimation2 = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: offsetAnimationController,
        curve: const Interval(
          0.2,
          0.7,
          curve: Curves.ease,
        ),
      ),
    );
    offsetAnimation3 = Tween<Offset>(
      begin: const Offset(-3, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: offsetAnimationController,
        curve: const Interval(
          0.4,
          0.9,
          curve: Curves.ease,
        ),
      ),
    );

    offsetAnimationController.forward();
  }

  @override
  void onClose() {
    offsetAnimationController.dispose();
    super.onClose();
  }
}
