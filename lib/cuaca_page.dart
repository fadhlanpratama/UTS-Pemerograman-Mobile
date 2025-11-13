import 'package:flutter/material.dart';

class CuacaPage extends StatelessWidget {
  const CuacaPage({super.key});

  final List<Map<String, dynamic>> dataCuaca = const [
    {
      'kota': 'Jakarta',
      'suhu': '31°C',
      'cuaca': 'Panas & Lembap',
      'icon': Icons.wb_sunny_outlined,
      'color1': Color(0xFFFFB74D),
      'color2': Color(0xFFFFE0B2),
    },
    {
      'kota': 'Surabaya',
      'suhu': '33°C',
      'cuaca': 'Sangat Panas',
      'icon': Icons.wb_sunny_rounded,
      'color1': Color(0xFFFF8A65),
      'color2': Color(0xFFFFCCBC),
    },
    {
      'kota': 'Bogor',
      'suhu': '24°C',
      'cuaca': 'Hujan Ringan',
      'icon': Icons.beach_access,
      'color1': Color(0xFF4FC3F7),
      'color2': Color(0xFFE1F5FE),
    },
    {
      'kota': 'Yogyakarta',
      'suhu': '28°C',
      'cuaca': 'Cerah',
      'icon': Icons.wb_sunny,
      'color1': Color(0xFF81D4FA),
      'color2': Color(0xFFB3E5FC),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan gradasi warna langit
      appBar: AppBar(
        title: const Text('Cuaca Hari Ini'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB3E5FC), Color(0xFFE1F5FE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🌤 Bagian utama (cuaca lokasi kamu: Bandung)
              const SizedBox(height: 20),
              const Icon(Icons.cloud, size: 120, color: Colors.white),
              const SizedBox(height: 10),
              const Text(
                'Bandung',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Cerah Berawan',
                style: TextStyle(fontSize: 20, color: Colors.white70),
              ),
              const SizedBox(height: 10),
              const Text(
                '26°C',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Card info tambahan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Column(
                          children: [
                            Icon(Icons.air, color: Colors.blueAccent),
                            SizedBox(height: 4),
                            Text('12 km/jam',
                                style: TextStyle(color: Colors.grey)),
                            Text('Angin',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.opacity, color: Colors.blueAccent),
                            SizedBox(height: 4),
                            Text('65%',
                                style: TextStyle(color: Colors.grey)),
                            Text('Kelembapan',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.wb_sunny, color: Colors.orangeAccent),
                            SizedBox(height: 4),
                            Text('UV: 5',
                                style: TextStyle(color: Colors.grey)),
                            Text('Indeks UV',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // 🌆 Daftar cuaca kota lain
              const Text(
                'Kota Lainnya',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: dataCuaca.map((item) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [item['color1'], item['color2']],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(3, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading:
                        Icon(item['icon'], size: 40, color: Colors.white),
                        title: Text(
                          item['kota'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        subtitle: Text(
                          item['cuaca'],
                          style: const TextStyle(color: Colors.white70),
                        ),
                        trailing: Text(
                          item['suhu'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
