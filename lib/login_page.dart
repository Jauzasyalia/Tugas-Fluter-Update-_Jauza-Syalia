import 'package:flutter/material.dart';
import 'package:coba_pertama/components/custom_button.dart';
import 'package:coba_pertama/components/custom_textfield.dart'; // Hanya di-import 1x

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  String statusLogin = "";

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Clone Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              statusLogin.isEmpty
                  ? "Welcome to Application"
                  : "Welcome to Application ($statusLogin)",
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 240, 6, 6),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            
            // CustomTextfield Username
            CustomTextfield(
              txtController: username,
              myHint: "input username",
              keyboardType: TextInputType.text,
              inputFormatters: const [],
            ),
            const SizedBox(height: 10),

            // CustomTextfield Password
            CustomTextfield(
              txtController: password,
              myHint: "input password",
              keyboardType: TextInputType.visiblePassword,
              inputFormatters: const [],
            ),
            
            // Row Tombol Login & Register
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Login",
                    onPressed: () {
                      setState(() {
                        String user = username.text.trim();
                        String pass = password.text.trim();

                        if (user == "admin" && pass == "admin") {
                          print("Login Berhasil");
                          statusLogin = "admin";
                        } else {
                          print("Login Gagal");
                          statusLogin = "failed";
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    text: "Register",
                    backgroundColor: Colors.grey,
                    onPressed: () {
                      // Aksi register
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}