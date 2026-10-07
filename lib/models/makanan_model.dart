class MakananModel {
  final String namaMakanan;
  final String hargamakanan;
  final String gambar; // URL gambar atau path asset
  final String desc;
  final double rating;
  final String review;

  // ini kosntruktor
  // agar nanti bisa langsung di isikan ketika membuat object dari class ini 
  MakananModel({
    required this.namaMakanan,
    required this.hargamakanan,
    required this.gambar,
    required this.desc,
    required this.rating,
    required this.review,
    }
  );
}