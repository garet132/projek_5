import 'package:flutter/material.dart';
//coba
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Resep Makanan',
      theme: ThemeData(useMaterial3: true),
      home: const RecipeDetailPage(),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text('Detail Resep', style: TextStyle(color: Colors.white)),
        actions: const [
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BAGIAN ATAS: Dua Kotak Besar (Visual Utama)
            Row(
              children: [
                Expanded(child: _buildMainCard(Icons.restaurant, "Bahan Utama")),
                const SizedBox(width: 16),
                Expanded(child: _buildMainCard(Icons. whatshot, "Cara Masak")),
              ],
            ),
            const SizedBox(height: 24),

            // BAGIAN TENGAH: Tiga Kotak Oranye (Info Cepat)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoBox(Icons.timer, "30 Menit"),
                _buildInfoBox(Icons.group, "4 Porsi"),
                _buildInfoBox(Icons.star, "Mudah"),
              ],
            ),
            const SizedBox(height: 32),

            // BAGIAN BAWAH: Teks Deskripsi
            const Text(
              "Langkah-langkah Pembuatan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const Text(
              "1. Siapkan semua bahan yang telah dicuci bersih.\n"
              "2. Panaskan wajan dengan sedikit minyak zaitun.\n"
              "3. Tumis bumbu halus hingga harum dan berubah warna.\n"
              "4. Masukkan bahan utama dan aduk hingga merata.\n"
              "5. Tambahkan penyedap rasa dan sajikan selagi hangat.",
              style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Kotak Besar Atas
  Widget _buildMainCard(IconData icon, String label) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[400]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.grey[600]),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  // Widget Kotak Oranye Tengah
  Widget _buildInfoBox(IconData icon, String text) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: const Color(0xFFE69138), // Oranye sesuai wireframe
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 8),
        Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        Container(width: 40, height: 2, color: Colors.grey[300]), // Garis bawah kecil
      ],
    );
  }
}