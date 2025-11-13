import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  final List<Map<String, String>> beritaList = const [
    {
      'judul': 'Teknologi AI Makin Berkembang',
      'isi':
      'AI kini digunakan di berbagai bidang termasuk pendidikan, kesehatan, dan industri kreatif.'
    },
    {
      'judul': 'Flutter Tetap Populer di 2025',
      'isi':
      'Flutter masih menjadi pilihan utama untuk membuat aplikasi mobile lintas platform.'
    },
    {
      'judul': 'Mahasiswa Informatika Juara Nasional',
      'isi':
      'Mahasiswa berhasil menjuarai lomba coding tingkat nasional dengan inovasi aplikasi berbasis AI.'
    },
    {
      'judul': 'Kampus Go Green',
      'isi':
      'Program “Kampus Hijau” diterapkan di berbagai universitas untuk mendukung lingkungan berkelanjutan.'
    },
    {
      'judul': 'Robotika dan Otomasi',
      'isi':
      'Teknologi robotika membuka peluang besar di dunia industri dan pendidikan tinggi.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Berita Terkini',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        centerTitle: true,
        elevation: 5,
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

      backgroundColor: const Color(0xFFF3F6FF),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: beritaList.length,
          itemBuilder: (context, index) {
            final berita = beritaList[index];

            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Membuka: ${berita['judul']}'),
                    backgroundColor: Colors.blueAccent,
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(3, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.blueAccent.withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Judul berita
                    Text(
                      berita['judul']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // 🔸 Isi berita
                    Text(
                      berita['isi']!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // 🔻 Garis pembatas dekoratif
                    Container(
                      height: 2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blueAccent.withOpacity(0.5),
                            Colors.lightBlueAccent.withOpacity(0.3)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    const SizedBox(height: 6),

                    // 🔹 Teks tambahan di bawah
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Baca Selengkapnya',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color: Colors.blueAccent, size: 14),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
