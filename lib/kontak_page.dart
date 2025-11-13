import 'package:flutter/material.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  final List<Map<String, String>> kontakList = const [
    {'nama': 'Eka', 'telepon': '081278901234'},
    {'nama': 'Rani', 'telepon': '081234567890'},
    {'nama': 'Budi', 'telepon': '082233445566'},
    {'nama': 'Sinta', 'telepon': '083345678901'},
    {'nama': 'Dodi', 'telepon': '085512345678'},
    {'nama': 'Eka', 'telepon': '081278901234'},
    {'nama': 'Fajar', 'telepon': '081398765432'},
    {'nama': 'Gina', 'telepon': '082198745632'},
    {'nama': 'Hadi', 'telepon': '081334455667'},
    {'nama': 'Indah', 'telepon': '081299887766'},
    {'nama': 'Joko', 'telepon': '082155544433'},
    {'nama': 'Karin', 'telepon': '081377788899'},
    {'nama': 'Lia', 'telepon': '085267889900'},
    {'nama': 'Miko', 'telepon': '083155533322'},
    {'nama': 'Nina', 'telepon': '081366677788'},
    {'nama': 'Omar', 'telepon': '082233445500'},
    {'nama': 'Putri', 'telepon': '081255566677'},
    {'nama': 'Qori', 'telepon': '081344556677'},
    {'nama': 'Rafi', 'telepon': '085212345678'},
    {'nama': 'Salsa', 'telepon': '083122334455'},
  ];

  Color _avatarColor(int index) {
    final colors = [
      Colors.blueAccent,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kontak'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF4F6FB),

      // 🔥 Ini ListView langsung di body (tanpa Column)
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: kontakList.length,
        itemBuilder: (context, index) {
          final kontak = kontakList[index];
          return Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _avatarColor(index),
                child: Text(
                  kontak['nama']![0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                kontak['nama']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                kontak['telepon']!,
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.message, color: Colors.green),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Mengirim pesan ke ${kontak['nama']}...'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.phone, color: Colors.blueAccent),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Menelepon ${kontak['nama']}...'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
