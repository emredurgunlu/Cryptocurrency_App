import 'package:cryptocurrency_app/controllers/animation_offset.dart';
import 'package:cryptocurrency_app/controllers/connectivity.dart';
import 'package:cryptocurrency_app/controllers/package_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User extends GetView<AnimationOffset> {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppInfo i = Get.find();
    final Connect c = Get.find();
    c.initConnect();
    var boxDecoration = BoxDecoration(
      color: Colors.blue.shade100,
      shape: BoxShape.rectangle,
      border: Border.all(width: 4, color: Colors.indigo),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
    return Scaffold(
      appBar: AppBar(title: const Text("User Info")),
      body: GetBuilder<AnimationOffset>(
        init: AnimationOffset(),
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              SlideTransition(
                position: _.offsetAnimation1,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: boxDecoration,
                  child: const Text("Emre DURGUNLU"),
                ),
              ),
              SlideTransition(
                position: _.offsetAnimation2,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: boxDecoration,
                  child: Column(
                    children: [
                      Text("App Name: ${i.appName}"),
                      Text("Package Name: ${i.packageName}"),
                      Text("Version: ${i.version}"),
                      Text("Build Number: ${i.buildNumber}"),
                      const Text("Build Signature:"),
                      Text(i.buildSignature),
                    ],
                  ),
                ),
              ),
              SlideTransition(
                position: _.offsetAnimation3,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: boxDecoration,
                  child: Text("Network Type: ${c.networkResult}"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
