import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:get/instance_manager.dart';

import '../controllers/user_controller.dart';
import '../routes/app_pages.dart';

class RouteAuthMiddleware extends GetMiddleware {
  final UserController userController = Get.find<UserController>();

  RouteAuthMiddleware({priority}) : super(priority: priority);

  @override
  RouteSettings? redirect(String? route) {
    return userController.user.id == null
        ? const RouteSettings(name: ROUTES.login)
        : null;
  }
}