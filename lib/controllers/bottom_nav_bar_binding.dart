import 'package:cryptocurrency_app/controllers/animation_offset.dart';
import 'package:cryptocurrency_app/controllers/connectivity.dart';
import 'package:cryptocurrency_app/controllers/package_info.dart';
import 'package:cryptocurrency_app/controllers/system_bar.dart';
import 'package:get/instance_manager.dart';

import 'bottom_nav_bar.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBar>(() => BottomNavBar());
    Get.lazyPut<AnimationOffset>(() => AnimationOffset());
    Get.lazyPut<SystemBar>(() => SystemBar());
    Get.put<Connect>(Connect());
    Get.put<AppInfo>(AppInfo());
  }
}
