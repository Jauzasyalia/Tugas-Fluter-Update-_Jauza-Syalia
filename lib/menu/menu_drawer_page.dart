import 'package:coba_pertama/controller/menu_drawer_controller.dart';
import 'package:flutter/material.dart';

class MenuDrawerPage extends StatefulWidget {
  const MenuDrawerPage({super.key});

  @override
  State<MenuDrawerPage> createState() => _MenuDrawerPageState();
}

class _MenuDrawerPageState extends State<MenuDrawerPage> {
  final MenuDrawerController ctr = MenuDrawerController();

  @override
  void dispose() {
    ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ctr,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(title: Text(ctr.titles[ctr.selectedIndex])),
          drawer: Drawer(
            child: ListView(
              children: [
                const DrawerHeader(
                  child: Text('Menu', style: TextStyle(fontSize: 24)),
                ),
                for (int i = 0; i < ctr.titles.length; i++)
                  ListTile(
                    leading: Icon(ctr.icons[i]),
                    title: Text(ctr.titles[i]),
                    selected: ctr.selectedIndex == i,
                    onTap: () {
                      ctr.changePage(i); 
                      Navigator.pop(context); 
                    },
                  ),
              ],
            ),
          ),
          body: PageView(
            controller: ctr.pageController,
            physics: const NeverScrollableScrollPhysics(), // pindah cuma lewat menu
            children: ctr.pages,
          ),
        );
      },
    );
  }
}