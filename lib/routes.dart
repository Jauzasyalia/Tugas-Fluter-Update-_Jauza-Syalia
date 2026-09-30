import 'package:coba_pertama/page/Confirm_reg_page.dart';
import 'package:coba_pertama/page/registration_page.dart';
import 'package:get/get.dart';

class Routes {
  // list variabel nama halaman 
  static const String registration = "/registration";
  static const String confirm_registration = "/confirm_registration";
  // others page hare 

  // untuk di daftarkan di main dart
  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirm_registration, page: () => ConfirmRegPage()),
  ];
}