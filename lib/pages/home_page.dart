import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'activity_feed_page.dart';
import 'feed_page.dart';
import 'search_page.dart';
import 'upload_page.dart';
import 'profile_page.dart';
import '../controllers/page_controller.dart';
import '../controllers/user_controller.dart';

const List<IconData> NAV_ITEMS = [
  Icons.home,
  Icons.search,
  Icons.add_circle,
  Icons.star,
  Icons.person
];

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = HomePageController.to;
  final userController = UserController.to; 

  void navigationTapped(int page) {
    //Animating Page
    controller.animateTo(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: [
            Container(
              color: Colors.white,
              child: FeedPage(),
            ),
            Container(
              color: Colors.white,
              child: SearchPage(),
            ),
            Container(
              color: Colors.white,
              child: Uploader(),
            ),
            Container(
              color: Colors.white,
              child: ActivityFeedPage(),
            ),
            Container(
                color: Colors.white,
                child: ProfilePage(
                  userId: userController.user.id,
                )),
          ],
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: controller.onPageChanged,
        ),
        bottomNavigationBar: Obx(
          () => CupertinoTabBar(
            backgroundColor: Colors.white,
            currentIndex: controller.page.value,
            items: NAV_ITEMS
                .map(
                  (icon) => BottomNavigationBarItem(
                    icon: Icon(
                      icon,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      icon,
                      color: Colors.black,
                    ),
                    label: '',
                    backgroundColor: Colors.white,
                  ),
                )
                .toList(),
            onTap: navigationTapped,
          ),
        ));
  }
}
