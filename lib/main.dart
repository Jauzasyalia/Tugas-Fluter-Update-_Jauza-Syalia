import 'package:coba_pertama/login_clone_page.dart';
import 'package:coba_pertama/login_page.dart';
import 'package:coba_pertama/page/kalkulator_page.dart';
import 'package:coba_pertama/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Learning App",
      initialRoute: Routes.list_makanan, 
      getPages: Routes.myPages

    );
  }
}


