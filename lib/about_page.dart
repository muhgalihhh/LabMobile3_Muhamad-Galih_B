import 'package:flutter/material.dart';
import 'package:modul_3/side_menu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang menjadi putih
      appBar: AppBar(
        title: const Text('Halaman Tentang'),
        backgroundColor: Colors.white, // Latar belakang AppBar menjadi putih
        foregroundColor: Colors.black, // Warna teks AppBar menjadi hitam
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tentang Aplikasi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend', // Menggunakan font Lexend
                  color: Colors.black, // Warna judul menjadi hitam
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Aplikasi ini dirancang untuk membantu pengguna mencari film dengan mudah. '
                'Dengan antarmuka yang sederhana dan intuitif, pengguna dapat menjelajahi '
                'berbagai film yang tersedia dan mendapatkan informasi detail tentang film tersebut.',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Lexend', // Menggunakan font Lexend
                    color: Colors.black87), // Warna teks menjadi hitam
              ),
              const SizedBox(height: 16),
              const Text(
                'Fitur Utama:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend', // Menggunakan font Lexend
                  color: Colors.black, // Warna fitur menjadi hitam
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.search, color: Colors.black54),
                    title: Text('Mencari film berdasarkan judul',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lexend',
                            color: Colors.black)),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.info, color: Colors.black54),
                    title: Text('Melihat detail film',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lexend',
                            color: Colors.black)),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.mobile_friendly, color: Colors.black54),
                    title: Text('Antarmuka yang responsif dan ramah pengguna',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lexend',
                            color: Colors.black)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Dikembangkan oleh:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend', // Menggunakan font Lexend
                  color: Colors.black, // Warna pengembang menjadi hitam
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Muhamad Galih\n'
                'muhamad.galih@mhs.unsoed.ac.id\n'
                'Tahun 2024',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Lexend', // Menggunakan font Lexend
                    color:
                        Colors.black87), // Warna teks pengembang menjadi hitam
              ),
            ],
          ),
        ),
      ),
      drawer: SideMenu(),
    );
  }
}
