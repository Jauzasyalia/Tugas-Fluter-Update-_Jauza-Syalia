import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tidak pakai Scaffold sendiri, karena Scaffold + AppBar + Drawer
    // ada di halaman utama (sesuai papan tulis).
    return Center(child: Text("ini History page"));
  }
}