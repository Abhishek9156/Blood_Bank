import 'package:blood_bank/binding/snackbar.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../screens/login_screen/login_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>LoginController());
  }

}