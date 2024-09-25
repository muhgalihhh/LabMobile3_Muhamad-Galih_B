import 'package:flutter/material.dart';
import 'package:modul_3/about_page.dart';
import 'package:modul_3/home_page.dart';
import 'package:modul_3/login_page.dart';
import 'package:modul_3/search_film.dart'; // Import untuk halaman pencarian
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  // Fungsi untuk memuat nama pengguna dari SharedPreferences
  Future<String> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ??
        'Pengguna'; // Default ke 'Pengguna' jika tidak ditemukan
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: FutureBuilder<String>(
          future: _loadUsername(), // Memuat nama pengguna
          builder: (context, snapshot) {
            return ListView(
              children: [
                const DrawerHeader(
                  child: Text(
                    "Aplikasi Film",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Lexend', // Set font to Lexend
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                // Pesan selamat datang
                if (snapshot.connectionState == ConnectionState.done)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Selamat datang, ${snapshot.data}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lexend', // Set font to Lexend
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.black),
                  title: const Text(
                    'Home',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend'), // Set font to Lexend
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                // Tambahkan ListTile untuk Pencarian
                ListTile(
                  leading: const Icon(Icons.search, color: Colors.black),
                  title: const Text(
                    'Search',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend'), // Set font to Lexend
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchFilm()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info, color: Colors.black),
                  title: const Text(
                    'About',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend'), // Set font to Lexend
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.black),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend'), // Set font to Lexend
                  ),
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: const [
              Icon(
                Icons.logout,
                color: Colors.red,
                size: 30,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: 'Lexend', // Set font to Lexend
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'Mau logout lu?',
              style: TextStyle(
                fontFamily: 'Lexend', // Set font to Lexend
                fontSize: 16,
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
              },
              child: const Text(
                'Batal',
                style: TextStyle(
                  fontFamily: 'Lexend', // Set font to Lexend
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove(
                    'username'); // Hapus username dari SharedPreferences
                Navigator.pop(context); // Tutup dialog
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (Route<dynamic> route) => false,
                ); // Navigasi ke halaman Login
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Lexend', // Set font to Lexend
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
