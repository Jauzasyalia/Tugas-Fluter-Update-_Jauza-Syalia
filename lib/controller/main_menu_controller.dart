import 'package:coba_pertama/menu/history_page.dart';
import 'package:coba_pertama/menu/home_page.dart';
import 'package:coba_pertama/menu/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {

  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
      selectedIndex.value = index;
  }

  // list of page inside menu

  List<Widget> listPages = [HomePage(), HistoryPage(), ProfilePage()];

  // judul dan icon menu, dipakai AppBar, Drawer, dan BottomNavigationBar

  List<String> listTitles = ["Home", "History", "Profile"];

  List<IconData> listIcons = [
    Icons.home_outlined,
    Icons.history_outlined,
    Icons.person_outline,
  ];
}
