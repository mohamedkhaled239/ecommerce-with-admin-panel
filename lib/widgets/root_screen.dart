import 'package:ecommerce2/screens/cart/cart_screen.dart';
import 'package:ecommerce2/screens/home_screen.dart';
import 'package:ecommerce2/screens/profile__screen.dart';
import 'package:ecommerce2/screens/search_screen.dart';
import 'package:ecommerce2/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';


class RootScreen extends StatefulWidget {
    static const RoutName = '/RootScreen';

  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController controller;
  int currentScreen = 0;
  List<Widget> screens = [
     const HomeScreen(),
    const SearchScreen(),
     CartScreen(),
    const ProfileScreen()
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.home),
            icon: Icon(IconlyLight.home),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.search),
            icon: Icon(IconlyLight.search),
            label: "Search",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.bag2),
            icon: Badge(
              backgroundColor: Colors.blue,
              label: SubtitleTextWidget(label: "6",fontSize: 12,),
              child: Icon(IconlyLight.bag2)),
            label: "Cart",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyLight.profile),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
