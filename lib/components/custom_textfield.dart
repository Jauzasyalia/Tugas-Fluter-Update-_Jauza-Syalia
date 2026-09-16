import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  // kita list variabrl yg di butuh kan 
  final TextEditingController txtController;
  final String myHint;

  const CustomTextfield({
    super.key,
    required this.txtController,
    required this.myHint,
    });

  @override
  Widget build(BuildContext context) {
    return TextField (
      controller: txtController,

      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hint: Text (myHint),
      ),
    );
  }
}