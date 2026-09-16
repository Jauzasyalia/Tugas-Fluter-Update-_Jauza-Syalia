import 'package:flutter/material.dart';
import 'package:coba_pertama/components/clone_textfield.dart';
import 'package:coba_pertama/components/clone_button.dart';

class LoginClonePage extends StatelessWidget {
  LoginClonePage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        title: const Text("Masuk", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            //  logo bawaan fluter
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.g_mobiledata, size: 28, color: Colors.red),
              label: const Text("Masuk dengan Google", style: TextStyle(color: Colors.black, fontSize: 16)),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.apple, size: 24, color: Colors.black),
              label: const Text("Masuk dengan Apple", style: TextStyle(color: Colors.black, fontSize: 16)),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 24),

           // line
            Row(
              children: const [
                Expanded(child: Divider(color: Colors.grey)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text("atau", style: TextStyle(color: Colors.white70)),
                ),
                Expanded(child: Divider(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 24),


            const Text("E-mail", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            CloneTextfield(
              txtController: emailController,
              myHint: "Email Anda",
            ),
            const SizedBox(height: 12),

            // Checkbox
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: true,
                    activeColor: Colors.orange,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 8),
                const Text("Ingatlah aku", style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 20),

            const CloneButton(
              text: "Masuk",
              backgroundColor: Color(0xFFD3480C),
            ),
            const SizedBox(height: 24),

            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Buat Akun Baru",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Wrap(
              alignment: WrapAlignment.center,
              children: const [
                Text("Dengan melanjutkan, Anda menyetujui Ketentuan Layanan dan  Kebijakan Privasi kami", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
