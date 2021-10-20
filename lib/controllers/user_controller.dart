import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/route_manager.dart';

import '../models/user.dart';
import '../routes/app_pages.dart';
import '../repositories/user_repository.dart';

class UserController extends GetxController {
  UserRepository _repo;

  UserController(this._repo) {}
  final _user = User().obs;
  // TODO: Error

  static UserController get to => Get.find<UserController>();
  User get user => _user.value;

  @override
  onInit() {
    print('UserController onInit');
    super.onInit();
  }

  @override
  onClose() {
    try {
      throw 42;
    } on Exception catch (_) {
      print('It should not happen');
    }
    super.onClose();
  }

  Future<void> _entryUser() async {
    final user = await _repo.loginUser();
    if (user != null) {
      _user(user);
      Get.offNamed(ROUTES.home);
    }
  }

  Future<void> checkUser() async {
    final succeess = await _repo.checkUser();
    if (succeess) {
      _entryUser();
    } else {
      Get.offNamed(ROUTES.login);
    }
  }

  Future<void> logut() async {
    await _repo.logut();
    Get.offAllNamed(ROUTES.login);
  }

  Future<void> loginWithGoogle() async {
    final success = await _repo.signInGoogle();

    if (success) {
      _entryUser();
    }
  }
}
