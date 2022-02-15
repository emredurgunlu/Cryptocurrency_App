import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SystemBar extends GetxController {
  void sistemBar(Color _color, Brightness iconBright) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: _color, statusBarIconBrightness: iconBright),
    );
  }
}
