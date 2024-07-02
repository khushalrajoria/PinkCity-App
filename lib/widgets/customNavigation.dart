import 'package:PinkCity/screens/homeScreen.dart';
import 'package:PinkCity/screens/moreScreen.dart';
import 'package:PinkCity/screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../screens/cart_screen.dart';


class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({final Key? key,})
      : super(key: key);


  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  PersistentTabController _controller=PersistentTabController();
  bool _hideNavBar=false;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
          HomeScreen(),
        const ProfileScreen(),
        const Cart(),
        const MoreScreen()
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: "Home",
            activeColorPrimary: Colors.pink,
            inactiveColorPrimary: Colors.grey,
            inactiveColorSecondary: Colors.purple),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_2_outlined),
          title: "Account",
          activeColorPrimary: const Color.fromARGB(255, 170, 11, 64),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.card_travel_sharp),
          title: "Cart",
          activeColorPrimary: const Color.fromARGB(255, 150, 0, 92),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.list),
          title: "More",
          activeColorPrimary: Colors.pinkAccent,
          inactiveColorPrimary: Colors.grey,
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle
              .style1, 
        ),
      );
}