import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  //  mengambil nilai dari TextField
  final TextEditingController _controllerA1 = TextEditingController();
  final TextEditingController _controllerA2 = TextEditingController();

  String _hasil = "0";

  //  operasi aritmatika
  void _hitung(String operasi) {
    double? a1 = double.tryParse(_controllerA1.text);
    double? a2 = double.tryParse(_controllerA2.text);

    if (a1 == null || a2 == null) {
      setState(() {
        _hasil = "Input tidak valid";
      });
      return;
    }

    double res = 0;
    switch (operasi) {
      case '+':
        res = a1 + a2;
        break;
      case '-':
        res = a1 - a2;
        break;
      case 'x':
        res = a1 * a2;
        break;
      case '/':
        if (a2 == 0) {
          setState(() {
            _hasil = "Tidak bisa bagi 0";
          });
          return;
        }
        res = a1 / a2;
        break;
    }

    setState(() {
      // Hapus angka .0 jika hasil berupa bilangan bulat
      _hasil = res % 1 == 0 ? res.toInt().toString() : res.toString();
    });
  }

  // Fungsi untuk mengosongkan form
  void _reset() {
    setState(() {
      _controllerA1.clear();
      _controllerA2.clear();
      _hasil = "0";
    });
  }

  @override
  void dispose() {
    _controllerA1.dispose();
    _controllerA2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            Text(
              "Kalkulator ",
              style: TextStyle(
                fontSize: 30,
                color: const Color.fromRGBO(5, 147, 230, 1),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),

            //  a1 dan a2 
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controllerA1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "a1",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _controllerA2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "a2",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // button (+ - x /)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _hitung('+'),
                  child: const Text("+", style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('-'),
                  child: const Text("-", style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('x'),
                  child: const Text("x", style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('/'),
                  child: const Text("/", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Text(
              "Hasil: $_hasil",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            //  Reset
            ElevatedButton(
              onPressed: _reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}