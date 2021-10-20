import 'package:Fluttergram/controllers/page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

const List<IconData> NAV_ITEMS = [
  Icons.home,
  Icons.search,
  Icons.add_circle,
  Icons.star,
  Icons.person
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomePageController.to;

  @override
  void initState() {
    super.initState();
  }

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
              // child: Feed(),
            ),
            Container(
              color: Colors.white,
              // child: SearchPage(),
            ),
            Container(
              color: Colors.white,
              // child: Uploader(),
            ),
            Container(
              color: Colors.white,
              // child: ActivityFeedPage(),
            ),
            Container(
              color: Colors.white,
              // child: ProfilePage(
              // userId: googleSignIn.currentUser.id,
              // )
            ),
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
