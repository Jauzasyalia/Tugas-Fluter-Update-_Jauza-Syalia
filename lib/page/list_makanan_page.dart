import 'package:coba_pertama/controller/list_makanan_controller.dart';
import 'package:coba_pertama/page/detail_makanan_page.dart';
import 'package:coba_pertama/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMakananPage extends StatelessWidget {
  ListMakananPage({super.key});

  final controller = Get.put(ListmakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Makanan")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.listMakanan.length,
            itemBuilder: (context, index) {
              final makanan = controller.listMakanan[index]; // ngambil data 
              return Dismissible(
                key: ValueKey(makanan.namaMakanan),
                direction: DismissDirection.endToStart,
                background: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon( // icon tong sampah 
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                onDismissed: (direction) {
                  controller.listMakanan.removeAt(index);
                  Get.snackbar(
                    "Berhasil", 
                    "${makanan.namaMakanan} dihapus",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: InkWell(
                  onTap: () {
                    Get.to(Routes.detail_makanan, arguments: makanan);
                  },
                  child: Card(
                    elevation: 10,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          makanan.namaMakanan,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          makanan.hargamakanan,
                          style: const TextStyle(fontSize: 16),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios), // icon >
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}