import 'package:flutter/material.dart';

class CloneTextfield extends StatelessWidget {

  final TextEditingController txtController;
  final String myHint;

  const CloneTextfield({
    super.key,
    required this.txtController,
    required this.myHint,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      style: const TextStyle(color: Color.fromARGB(255, 255, 254, 254)),
      decoration: InputDecoration(
        hintText: myHint,
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}