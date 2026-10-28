import 'package:coba_pertama/menu/profile_page.dart';
import 'package:flutter/material.dart';
import '../profile_page.dart';

class MenuDrawerController extends ChangeNotifier {
  final PageController pageController = PageController();
  int selectedIndex = 0;

  final List<String> titles = ['Home', 'History', 'Profile'];
  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.history,
    Icons.person_outline,
  ];
  final List<Widget> pages = const [
    Center(child: Text('Halaman Home')),
    Center(child: Text('Halaman History')),
    ProfilePage(),
  ];

  void changePage(int index) {
    selectedIndex = index;
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}