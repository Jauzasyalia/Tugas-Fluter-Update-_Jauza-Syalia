import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List 5-7 gambar dari internet (contoh link gambar makanan/pemandangan)
    final List<Map<String, String>> listGambar = [
      {
        'judul': 'Soto Ayam',
        'gambar': 'https://tse4.mm.bing.net/th/id/OIP.k5ksubsIsTPTtoaGvOWooQHaE7?r=0&pid=Api&h=220&P=0'
      },
      {
        'judul': 'Sate Ayam',
        'gambar': 'https://tse4.mm.bing.net/th/id/OIP.eFq7Aw4SFhcfiOSpmU_8IwHaE8?r=0&pid=Api&h=220&P=0'
      },
      {
        'judul': 'Lentog Tanjung',
        'gambar': 'https://tse3.mm.bing.net/th/id/OIP.oZFYB736m7DzpSNnVGINOwHaE9?r=0&pid=Api&h=220&P=0'
      },
      {
        'judul': 'Ayam Bakar',
        'gambar': 'https://tse1.mm.bing.net/th/id/OIP.tSqriMyic9GNd_nuO3L9IwHaE8?r=0&pid=Api&h=220&P=0'
      },
      {
        'judul': 'Kwettiaw Seafood',
        'gambar': 'https://tse4.mm.bing.net/th/id/OIP.SiVquwg9nVDg7-eM2zNMxwHaEK?r=0&pid=Api&h=220&P=0'
      },
    ];

    // Tidak pakai Scaffold sendiri, karena Scaffold + AppBar + Drawer
    // ada di halaman utama (sesuai papan tulis).
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Geser ke kanan / kiri (Sesuai Sketsa Papan):",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          
          // Container pembatas tinggi untuk ListView horizontal (Sesuai catatan guru)
          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Membuat card bisa digeser ke kanan dan kiri
              itemCount: listGambar.length,
              itemBuilder: (context, index) {
                final item = listGambar[index];

                return Dismissible(
                  key: ValueKey(item['judul']),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    width: 200,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  onDismissed: (direction) {
                    // Aksi saat di-dismiss (hapus)
                  },
                  child: Container(
                    width: 150, // Lebar kotak gambar
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container untuk gambar dari internet
                        Container(
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),  
                            image: DecorationImage(
                              image: NetworkImage(item['gambar']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Container untuk teks judul di bawah gambar
                        Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center, // <-- Tambahkan alignment di sini juga agar posisinya pas di tengah kotak
                          child: Text(
                            item['judul']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}