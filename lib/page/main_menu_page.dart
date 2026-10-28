import 'package:coba_pertama/controller/main_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final mainMenuController = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
     return Obx(
      () => Scaffold(
        // AppBar otomatis menampilkan icon garis 3 karena Scaffold punya drawer
        appBar: AppBar(
          title: Text(
            mainMenuController.listTitles[mainMenuController.selectedIndex.value],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: Text(
                  "Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              for (int i = 0; i < mainMenuController.listTitles.length; i++)
                ListTile(
                  leading: Icon(mainMenuController.listIcons[i]),
                  title: Text(mainMenuController.listTitles[i]),
                  selected: mainMenuController.selectedIndex.value == i,
                  onTap: () {
                    mainMenuController.changePage(i);
                    Navigator.pop(context); // tutup drawer setelah pilih menu
                  },
                ),
            ],
          ),
        ),
        body: IndexedStack(
          index: mainMenuController.selectedIndex.value,
          children: mainMenuController.listPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: mainMenuController.changePage,
          currentIndex: mainMenuController.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
