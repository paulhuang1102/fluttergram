import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

import '../controllers/create_account_controller.dart';
import '../repositories/user_repository.dart';

class CreateAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(() => CreateAccountController(UserRepository()));
  }
}
