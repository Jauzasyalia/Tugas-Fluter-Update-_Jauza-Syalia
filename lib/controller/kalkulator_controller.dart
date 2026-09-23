import 'package:get/get.dart';

class KalkulatorController extends GetxController {

  var hasil = 0.obs; // obs singkatan dari observable, nilai ini bisa berubah dan akan memberi tahu widget yang mendengarkan perubahan ini. 

  // method tambah, kurang, kali, dan bagi
  void tambah ( int angka1, int angka2) {
    int hasilTambah = angka1 + angka2;
    hasil.value = hasilTambah; // update nilai hasil
    Get.snackbar("Hasil Tambah", "Hasilnya: ${hasilTambah}",
    snackPosition: SnackPosition.BOTTOM,);
  }

  void kurang ( int angka1, int angka2) {
    int hasilKurang = angka1 - angka2;
    hasil.value = hasilKurang; // update nilai hasil
    Get.snackbar("Hasil Kurang", "Hasilnya: ${hasilKurang}",
    snackPosition: SnackPosition.BOTTOM,);
  }

  void kali ( int angka1, int angka2) {
    int hasilKali = angka1 * angka2;
    hasil.value = hasilKali; // update nilai hasil
    Get.snackbar("Hasil Kali", "Hasilnya: ${hasilKali}",
    snackPosition: SnackPosition.BOTTOM,);
  }

  void bagi ( int angka1, int angka2) {
    int hasilBagi = angka1 ~/ angka2;
    hasil.value = hasilBagi; // update nilai hasil
    Get.snackbar("Hasil Bagi", "Hasilnya: ${hasilBagi}",
    snackPosition: SnackPosition.BOTTOM,);
  }

}