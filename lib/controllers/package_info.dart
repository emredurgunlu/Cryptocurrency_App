import 'package:package_info_plus/package_info_plus.dart';
import 'package:get/state_manager.dart';

//Package_info_plus paketinin kullanımı
class AppInfo extends GetxController {
  late PackageInfo packageInfo;
  late String appName;
  late String packageName;
  late String version;
  late String buildNumber;
  late String buildSignature;

  Future<void> _initPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    buildSignature = packageInfo.buildSignature;
  }

  @override
  void onInit() async {
    super.onInit();
    _initPackageInfo();
  }
}
