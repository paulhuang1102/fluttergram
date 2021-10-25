import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../repositories/user_repository.dart';
import './user_controller.dart';
import '../utils/logger.dart';

class CreateAccountController extends GetxController {
  static CreateAccountController get to => Get.find<CreateAccountController>();

  final username = ''.obs;
  // TODO: error
  final UserRepository _repo;

  CreateAccountController(this._repo);

  setName(String str) {
    username(str);
  }

  create() async {
    final exist = await _repo.fetchUserData(username.value);
    final userController = UserController.to;
    Log.debug(exist);
    Log.debug(userController.user.id);
    if (exist != null) {
      // Name occupied

      return;
    }

    final res = await _repo.createUserData(
      username: username.value,
      cognitoId: userController.user.id,
    );

    print(res.errors);
  }
}
