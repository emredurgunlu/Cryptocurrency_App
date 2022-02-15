import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/state_manager.dart';

//Connectivity_plus paketinin kullanımı
class Connect extends GetxController {
  late ConnectivityResult connectivityResult;
  late String networkResult;
  Future<void> initConnect() async {
    connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      networkResult = "mobile";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      networkResult = "wifi";
    } else {
      networkResult = "not connected";
    }
  }

  @override
  void onInit() async {
    super.onInit();
    initConnect();
  }
}
