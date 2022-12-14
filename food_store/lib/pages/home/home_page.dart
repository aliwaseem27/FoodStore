import 'package:flutter/material.dart';
import 'package:food_store/pages/cart/cart_page.dart';
import 'package:food_store/pages/home/main_food_page.dart';
import 'package:food_store/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  List pages = [
    MainFoodPage(),
    Container(
      child: Center(
        child: Text("Page 2"),
      ),
    ),
    CartPage(),
    Container(
      child: Center(
        child: Text("Page 4"),
      ),
    ),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amber,
        showSelectedLabels: false,
        currentIndex: _selectedPage,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Me",
          ),
        ],
      ),
    );
  }
}
