import 'package:get/instance_manager.dart';
import 'transfer_money.dart';

class TransferBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferMoney>(() => TransferMoney());
  }
}
