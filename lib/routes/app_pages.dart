import 'package:get/get.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../middlewares/router_auth.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    // GetPage(
    //   name: ROUTES.splash,
    //   page: () => const SplashPage(),
    // ),
    GetPage(
      name: ROUTES.home,
      page: () => HomePage(),
      middlewares: [
        RouteAuthMiddleware(),
      ],
    ),
    GetPage(
      name: ROUTES.login,
      page: () => LoginPage(),
      // binding: LoginBinding(),
    ),
    // GetPage(
    //   name: ROUTES.signup,
    //   page: () => SignupPage(),
    // ),
    // GetPage(
    //   name: ROUTES.toilet,
    //   page: () => const ToiletPage(),
    // ),
    // GetPage(
    //   name: ROUTES.eating,
    //   page: () => const EatingPage(),
    //   middlewares: [
    //     RouteAuthMiddleware(),
    //   ],
    // ),
    // GetPage(
    //   name: ROUTES.gallery,
    //   page: () => GalleryPage(),
    //   binding: GalleryBinding(),
    //   middlewares: [
    //     RouteAuthMiddleware(),
    //   ],
    // ),
  ];
}
