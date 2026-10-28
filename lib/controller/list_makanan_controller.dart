import 'package:get/get.dart';
import 'package:coba_pertama/models/makanan_model.dart';

class ListmakananController extends GetxController {
  RxList<MakananModel> listMakanan = <MakananModel>[
    MakananModel(
      namaMakanan: 'Soto Ayam',
      hargamakanan: 'Rp 15.000',
      gambar: 'https://tse4.mm.bing.net/th/id/OIP.k5ksubsIsTPTtoaGvOWooQHaE7?r=0&pid=Api&h=220&P=0',
      desc: 'Soto ayam kuah kuning gurih dengan irisan daging ayam segar, tauge, dan telur.',
      rating: 4.8,
      review: 'Kuahnya berkaldu banget, porsinya pas dan mengenyangkan!',
    ),
    MakananModel(
      namaMakanan: 'Sate Ayam',
      hargamakanan: 'Rp 14.000',
      gambar: 'https://tse4.mm.bing.net/th/id/OIP.eFq7Aw4SFhcfiOSpmU_8IwHaE8?r=0&pid=Api&h=220&P=0',
      desc: 'Sate ayam empuk dipanggang dengan bumbu kacang lezat dan kecap manis.',
      rating: 4.6,
      review: 'Bumbu kacangnya melimpah, dagingnya tebal!',
    ),
    MakananModel(
      namaMakanan: 'Lentog',
      hargamakanan: 'Rp 11.000',
      gambar: 'https://tse3.mm.bing.net/th/id/OIP.oZFYB736m7DzpSNnVGINOwHaE9?r=0&pid=Api&h=220&P=0',
      desc: 'Makanan khas Kudus berisi lontong, lodeh tahu tempe, dan gulai nangka muda.',
      rating: 4.9,
      review: 'Rasanya otentik banget khas Kudus!',
    ),
    MakananModel(
      namaMakanan: 'Ayam Bakar',
      hargamakanan: 'Rp 20.000',
      gambar: 'https://tse1.mm.bing.net/th/id/OIP.tSqriMyic9GNd_nuO3L9IwHaE8?r=0&pid=Api&h=220&P=0',
      desc: 'Ayam bakar bumbu rempah manis gurih disajikan lengkap dengan sambal dan lalapan.',
      rating: 4.7,
      review: 'Ayamnya beneran meresap sampai ke tulang.',
    ),
    MakananModel(
      namaMakanan: 'Kwettiau Goreng Seafood',
      hargamakanan: 'Rp 25.000',
      gambar: 'https://tse4.mm.bing.net/th/id/OIP.SiVquwg9nVDg7-eM2zNMxwHaEK?r=0&pid=Api&h=220&P=0',
      desc: 'Sajian mi beras pipih dan lebar yang dimasak bersama aneka hasil laut seperti udang, cumi, dan bakso ikan. Ditumis dengan bumbu bawang putih, kecap asin, kecap manis, serta minyak wijen yang memberikan aroma gurih khas wajan panas (wok hei). Biasanya dilengkapi orak-arik telur, tauge, dan sawi hijau yang renyah.',
      rating: 4.7,
      review: 'Seafoodnya fresh dan bumbunya mantap.',
    ),
  ].obs; // fungsi buat geser sama ngasih tau ui klo ada yg di hps
}