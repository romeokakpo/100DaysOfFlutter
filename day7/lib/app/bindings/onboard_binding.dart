import 'package:day7/app/controllers/onboard_controller.dart';
import 'package:get/get.dart';

class OnBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardController());
  }
}
