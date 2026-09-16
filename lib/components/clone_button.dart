import 'package:flutter/material.dart';

class CloneButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  const CloneButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Memenuhi lebar kontainer
      height: 50, // Tinggi standar tombol
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Menyesuaikan style border radius
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}