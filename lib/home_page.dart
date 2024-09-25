import 'package:flutter/material.dart';
import 'package:modul_3/search_film.dart'; // Import halaman pencarian film
import 'package:modul_3/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? namauser; // Mengubah var menjadi String? agar null safety terjaga

  @override
  void initState() {
    super.initState();
    _loadUsername(); // Memanggil fungsi di initState untuk satu kali
  }

  void _loadUsername() async {
    // Inisialisasi SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Ambil username yang sudah tersimpan
    setState(() {
      namauser = prefs.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pencarian Film'),
        backgroundColor: Colors.white, // Warna latar belakang AppBar
        foregroundColor: Colors.black, // Warna teks AppBar
        elevation: 3, // Shadow AppBar
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.tv, // Ganti dengan ikon yang sesuai
                size: 100,
                color: Colors.grey, // Warna ikon
              ),
              const SizedBox(height: 20),
              const Text(
                'Selamat Datang di Aplikasi Pencarian Film!',
                style: TextStyle(
                  fontFamily: 'Lexend', // Menggunakan font Lexend
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Warna teks
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Hai, ${namauser ?? "Pengguna"}!', // Default ke 'Pengguna' jika null
                style: const TextStyle(
                  fontFamily: 'Lexend', // Menggunakan font Lexend
                  fontSize: 18,
                  color: Colors.grey, // Warna teks
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Cari film favoritmu sekarang!',
                style: TextStyle(
                  fontFamily: 'Lexend', // Menggunakan font Lexend
                  fontSize: 16,
                  color: Colors.black54, // Warna teks
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman pencarian film
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchFilm()),
                  );
                },
                child: const Text('Cari Film'), // Teks pada tombol
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Warna latar belakang tombol
                  foregroundColor: Colors.white, // Warna teks tombol
                  textStyle: const TextStyle(
                    fontFamily: 'Lexend', // Menggunakan font Lexend
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
