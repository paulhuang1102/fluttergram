import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class HomePageController extends GetxController {
  final page = 0.obs;
  static HomePageController get to => Get.find<HomePageController>();
  final pageController = PageController();

  onPageChanged(input) {
    print(input);
    page.value = input;
  }

  animateTo(int page) {
    if (pageController.hasClients)
      pageController.animateToPage(page,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
