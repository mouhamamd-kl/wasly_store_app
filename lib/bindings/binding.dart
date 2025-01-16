import 'package:get/get.dart';
import 'package:wasly_store/controllers/nav_controller.dart';

class CustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavController());
  }
}
