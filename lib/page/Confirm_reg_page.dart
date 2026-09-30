import 'package:coba_pertama/controller/Confirm_reg_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmRegPage extends StatelessWidget {
  ConfirmRegPage({super.key});

  final controller = Get.put(ConfirmRegController()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirm Registration")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              
              Text(
                "Nama: ${controller.nama}",
                style: const TextStyle(fontSize: 25, color: Colors.blue),
              ),

              Text(
                "Jenis Kelamin: ${controller.jenisKelamin}", 
                style: const TextStyle(fontSize: 25, color: Colors.blue),
              ),

              Text(
                "Alamat: ${controller.alamat}", 
                style: const TextStyle(fontSize: 25, color: Colors.blue),
              ),

              Text(
              "Nomor WA: ${controller.noWa}",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Oke"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}