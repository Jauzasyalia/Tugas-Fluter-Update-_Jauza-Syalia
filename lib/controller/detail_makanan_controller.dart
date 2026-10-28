import 'package:get/get.dart';
import 'package:coba_pertama/models/makanan_model.dart';

class DetailmakananController extends GetxController {
  late String nama;
  late String harga;
  late String deskripsi;
  late String gambar;
  late  double rating;
  late String review;
  

  @override
  void onInit() {
    super.onInit();

    final MakananModel arguments = Get.arguments;
    nama = arguments.namaMakanan;
    harga = arguments.hargamakanan;
    gambar = arguments.gambar;
    deskripsi = arguments.desc;
    rating = arguments.rating;
    review = arguments.review;
  }
}