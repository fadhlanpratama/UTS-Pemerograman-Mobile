import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String input = '';
  String hasil = '';

  void tekan(String value) {
    setState(() {
      bool endsWithOperator = input.isNotEmpty && RegExp(r'[+\-×÷*/]').hasMatch(input[input.length - 1]);

      if (value == 'C') {
        input = '';
        hasil = '';
      } else if (value == '⌫') {
        if (input.isNotEmpty) input = input.substring(0, input.length - 1);
      } else if (value == '=') {
        if (input.isEmpty || endsWithOperator || input.endsWith('.')) {
          hasil = 'Format salah';
        } else {
          _hitung();
        }
      } else if (value == 'x²') {
        if (input.isNotEmpty) {
          double angka = double.tryParse(input) ?? 0;
          hasil = (angka * angka).toString();
          input = hasil;
        }
      } else if (value == '√') {
        if (input.isNotEmpty) {
          double angka = double.tryParse(input) ?? 0;
          hasil = angka < 0 ? 'Error' : sqrt(angka).toString();
          input = hasil;
        }
      } else if (RegExp(r'[+\-×÷*/]').hasMatch(value)) {
        if (input.isEmpty) {
          if (value == '-') input = '-';
        } else if (endsWithOperator) {
          input = input.substring(0, input.length - 1) + value;
        } else {
          input += value;
        }
      } else if (value == '.') {
        int lastOp = input.lastIndexOf(RegExp(r'[+\-×÷*/]'));
        String lastNum = lastOp == -1 ? input : input.substring(lastOp + 1);
        if (lastNum.contains('.')) return;
        if (lastNum.isEmpty) {
          input += '0.';
        } else {
          input += '.';
        }
      } else {
        input += value;
      }
    });
  }

  void _hitung() {
    try {
      String ekspresi = input.replaceAll('×', '*').replaceAll('÷', '/');
      while (ekspresi.isNotEmpty && RegExp(r'[+\-*/\.]$').hasMatch(ekspresi)) {
        ekspresi = ekspresi.substring(0, ekspresi.length - 1);
      }
      final res = _eval(ekspresi);
      hasil = res.isNaN ? 'NaN' : _formatNumber(res);
      input = hasil == 'NaN' ? '' : hasil;
    } catch (e) {
      hasil = 'Error';
    }
  }

  double _eval(String ekspresi) {
    ekspresi = ekspresi.trim();
    if (ekspresi.isEmpty) return 0;

    List<String> tokens = ekspresi
        .split(RegExp(r'([+\-*/])'))
        .map((t) => t.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    List<String> ops = [];
    for (int i = 0; i < ekspresi.length; i++) {
      String ch = ekspresi[i];
      if ('+-*/'.contains(ch)) ops.add(ch);
    }

    while (ops.length > tokens.length - 1) {
      ops.removeLast();
    }

    if (tokens.isEmpty) return 0;

    double result = double.tryParse(tokens[0]) ?? 0;

    for (int i = 0; i < ops.length; i++) {
      double val = 0;
      if (i + 1 < tokens.length) {
        val = double.tryParse(tokens[i + 1]) ?? 0;
      }
      String op = ops[i];

      switch (op) {
        case '+':
          result += val;
          break;
        case '-':
          result -= val;
          break;
        case '*':
          result *= val;
          break;
        case '/':
          result = val == 0 ? double.nan : result / val;
          break;
      }
    }

    return result;
  }

  String _formatNumber(double v) {
    if (v.isNaN) return 'NaN';
    if (v == v.roundToDouble()) return v.toInt().toString();
    return v.toString();
  }

  Widget tombol(String label,
      {Color warna = Colors.black87, Color bg = Colors.white}) {
    return ElevatedButton(
      onPressed: () => tekan(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        foregroundColor: warna,
        padding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Kalkulator Flutter'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                input,
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              width: double.infinity,
              child: Text(
                hasil.isEmpty ? '0' : hasil,
                style: const TextStyle(fontSize: 30, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  tombol('C', warna: Colors.white, bg: Colors.redAccent),
                  tombol('⌫', warna: Colors.white, bg: Colors.orange),
                  tombol('x²', warna: Colors.deepPurple, bg: Colors.white),
                  tombol('√', warna: Colors.deepPurple, bg: Colors.white),
                  tombol('7', bg: Colors.white),
                  tombol('8', bg: Colors.white),
                  tombol('9', bg: Colors.white),
                  tombol('÷', warna: Colors.blueAccent, bg: Colors.white),
                  tombol('4', bg: Colors.white),
                  tombol('5', bg: Colors.white),
                  tombol('6', bg: Colors.white),
                  tombol('×', warna: Colors.blueAccent, bg: Colors.white),
                  tombol('1', bg: Colors.white),
                  tombol('2', bg: Colors.white),
                  tombol('3', bg: Colors.white),
                  tombol('-', warna: Colors.blueAccent, bg: Colors.white),
                  tombol('0', bg: Colors.white),
                  tombol('.', bg: Colors.white),
                  tombol('=', warna: Colors.white, bg: Colors.blueAccent),
                  tombol('+', warna: Colors.blueAccent, bg: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
