import 'package:coba_pertama/page/Confirm_reg_page.dart';
import 'package:coba_pertama/page/list_makanan_page.dart';
import 'package:coba_pertama/page/registration_page.dart';
import 'package:get/get.dart';

class Routes {
  // list variabel nama halaman 
  static const String registration = "/registration";
  static const String confirm_registration = "/confirm_registration";
  static const String list_makanan = "/list_makanan";
  // others page hare 

  // untuk di daftarkan di main dart
  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirm_registration, page: () => ConfirmRegPage()),
    GetPage(name: list_makanan, page: () => ListMakananPage()),
  ];
}