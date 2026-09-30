import 'package:coba_pertama/components/custom_textfield.dart';
import 'package:coba_pertama/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});



  @override
  Widget build(BuildContext context) {
    TextEditingController txtNama = TextEditingController();
    TextEditingController txtJenisKelamin = TextEditingController();
    TextEditingController txtAlamat = TextEditingController();
      TextEditingController txtNoWa = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Registration Page")),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextfield(
                txtController: txtNama,
                myHint: "input name",
                keyboardType: TextInputType.text,
                inputFormatters: const [],
              ),

              const SizedBox(height: 10),
              CustomTextfield(
                txtController: txtJenisKelamin,
                myHint: "input jenis kelamin",
                keyboardType: TextInputType.text,
                inputFormatters: const [],
              ),

              const SizedBox(height: 10),
              CustomTextfield(
                txtController: txtAlamat,
                myHint: "input alamat",
                keyboardType: TextInputType.text,
                inputFormatters: const [],
              ),

              
              const SizedBox(height: 10),

              TextField(
                controller: txtNoWa,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  hintText: "input nomor WA",
                  border: OutlineInputBorder(),
                ),
              ),
              
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    Routes.confirm_registration,
                    arguments: {
                      'name': txtNama.text,
                      'jenis_kelamin': txtJenisKelamin.text,
                      'alamat': txtAlamat.text,
                      'no_wa': txtNoWa.text,
                    },
                  );
                },
                child: const Text("Send"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}