import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/account/account_page.dart';
import 'package:fooddelivery/pages/auth/sign_in_page.dart';
import 'package:fooddelivery/pages/auth/sign_up_page.dart';
import 'package:fooddelivery/pages/cart/cart_history.dart';
import 'package:fooddelivery/pages/home/main_food_page.dart';
import 'package:fooddelivery/utils/colors.dart';
//import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // late PersistentTabController _controller;

  List pages = [
    MainFoodPage(),
    Container(
      child: Text(
        "History page"
      ),
    ),
    CartHistory(),
    AccountPage()
  ];

  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label:
                "home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label:
                "history"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label:
                "cart"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:
                "me"
          ),
        ],
      ),
    );
  }
}
