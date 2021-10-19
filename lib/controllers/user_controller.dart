
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/route_manager.dart';

import '../models/user.dart';
import '../services/amplify/amplify_service.dart';

class UserController extends GetxController {
  final user = User().obs;


  entryUser() async {
    final user = await AmplifyService().Auth.fetchUser();
    // AnalyticsService.log(LoginEvent());

    // Get.offNamed(ROUTES.home);
  }

  checkUser() async {
    final succeess = await AmplifyService().Auth.checkAuthStatus();
    if (succeess) {
      entryUser();
    } else {
      // Get.offNamed(ROUTES.login);
    }
  }

  logut() async {
    await AmplifyService().Auth.signout();
    // Get.offAllNamed(ROUTES.login);
  }
}