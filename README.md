# Searching Film Menggunakan API

[![Flutter](https://img.shields.io/badge/Flutter-3.24.2-blue.svg?logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.5.2-blue.svg?logo=dart)](https://dart.dev/)
[![Android](https://img.shields.io/badge/Platform-Android-green.svg?logo=android)](https://developer.android.com/)
[![iOS](https://img.shields.io/badge/Platform-iOS-green.svg?logo=apple)](https://developer.apple.com/ios/)

<table>
  <tr>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/595d8118-e3e4-48a0-ab91-1e181ead8217" height="120" alt="anime-yes"/>
    </td>
    <td style="vertical-align: middle;">
      <h5>Nama: Muhamad Galih</h5>
      <h5>NIM: H1D022052</h5>
      <h5>Shift: E (Baru)</h5>
    </td>
  </tr>
</table>

## Deskripsi

Aplikasi Flutter ini adalah aplikasi manajemen film yang memungkinkan pengguna untuk menjelajahi, mencari, dan mendapatkan informasi mengenai film favorit mereka. Aplikasi ini dilengkapi dengan sistem autentikasi menggunakan SharedPreferences untuk menyimpan informasi pengguna. Dengan antarmuka yang bersih dan intuitif, aplikasi ini memberikan pengalaman pengguna yang menyenangkan dalam menjelajahi dunia film.

## Fitur

- **Sistem Autentikasi**: Pengguna dapat login dan menyimpan informasi pengguna (seperti nama) menggunakan SharedPreferences.
- **Navigasi Mudah**: Menggunakan drawer untuk navigasi antara halaman Home, Pencarian Film, dan halaman About dengan ikon yang intuitif.
- **Pencarian Film**: Pengguna dapat mencari film dengan mudah melalui halaman pencarian yang disediakan.
- **Pesan Selamat Datang**: Menampilkan pesan selamat datang kepada pengguna di menu samping setelah login.
- **Logout yang Aman**: Menyediakan opsi logout dengan konfirmasi untuk memastikan pengguna tidak keluar tanpa sengaja.
- **Desain Responsif**: Antarmuka yang responsif dengan tema warna yang bersih, memberikan pengalaman pengguna yang nyaman dan profesional.

## Prerequisites

Sebelum memulai, pastikan Anda memiliki hal berikut:

- [Flutter](https://flutter.dev/docs/get-started/install) versi terbaru
- [Dart](https://dart.dev/get-dart) versi terbaru

## Instalasi

1. Clone repositori ini ke mesin lokal Anda:

    ```bash
    git clone https://github.com/muhgalihhh/LabMobile3_Muhamad-Galih_E
    ```

2. Masuk ke direktori proyek:

    ```bash
    cd yourrepository
    ```

3. Install dependensi dengan perintah:

    ```bash
    flutter pub get
    ```

4. Jalankan aplikasi dengan:

    ```bash
    flutter run
    ```


# Demo Aplikasi



https://github.com/user-attachments/assets/e3f191d0-7f04-4820-b559-6bf1db13a647


# Penjelasan Aplikasi

## LoginPage
Berikut adalah penjelasan tentang kode Flutter yang didefinisikan dalam kelas `LoginPage`, yang berfungsi sebagai halaman login untuk aplikasi:

### Komponen Utama:

1. **Import**:
   - `flutter/material.dart`: Ini adalah pustaka inti Flutter untuk desain material.
   - `shared_preferences/shared_preferences.dart`: Pustaka ini memungkinkan Anda menyimpan dan mengambil data sederhana dalam bentuk pasangan kunci-nilai.

2. **Widget Stateful**:
   - `LoginPage` adalah subclass dari `StatefulWidget` untuk mempertahankan status dari form login.

3. **Pengontrol Animasi**:
   - `_animationController` dan animasi terkait (`_fadeInAnimation`, `_slideAnimation`) digunakan untuk membuat transisi halus pada elemen UI saat halaman dimuat.

4. **Pengontrol Teks**:
   - `_usernameController` dan `_passwordController` digunakan untuk menangkap input dari kolom username dan password.

5. **Kolom Input**:
   - Metode `_showInput` membuat `TextField` yang bergaya untuk input pengguna, yang menggunakan `SlideTransition` untuk efek animasi.

6. **Tampilan Dialog**:
   - Metode `_showDialog` menampilkan dialog peringatan untuk memberi tahu pengguna tentang keberhasilan atau kegagalan login. Ini termasuk opsi untuk menavigasi ke halaman lain.

7. **Dialog Info Aplikasi**:
   - Metode `_showAppInfo` menunjukkan dialog peringatan dengan informasi tentang aplikasi.

8. **Logika Login**:
   - Tombol login memeriksa apakah username dan password yang dimasukkan cocok dengan nilai yang sudah ditentukan ('admin'). Jika cocok, username disimpan menggunakan `SharedPreferences`, dan dialog keberhasilan ditampilkan. Jika tidak, dialog kegagalan ditampilkan.

9. **Metode Build**:
   - Metode `build` mendefinisikan struktur UI, termasuk AppBar, kolom input, dan tombol login. Ini juga menerapkan animasi saat halaman dimuat.

### Penjelasan Segmen Kode Penting:

- **Pengaturan Animasi**:
  ```dart
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;
  ```
  Segmen ini menginisialisasi animasi untuk halaman login guna meningkatkan pengalaman pengguna dengan efek visual.

- **Pembuatan Kolom Input**:
  ```dart
  Widget _showInput(TextEditingController controller, String placeholder,
      bool isPassword, IconData icon) {
    ...
  }
  ```
  Metode ini mengenkapsulasi logika untuk membuat kolom input, termasuk kustomisasi ikon dan placeholder.

- **Logika Login Pengguna**:
  ```dart
  onPressed: () {
    if (_usernameController.text == 'admin' &&
        _passwordController.text == 'admin') {
      _saveUsername();
      _showDialog('Login Berhasil', 'Anda berhasil login.', const HomePage());
    } else {
      _showDialog('Login Gagal', 'Username atau password salah.', const LoginPage(),
          isSuccess: false);
    }
  }
  ```
  Logika ini memeriksa kredensial pengguna dan memberikan umpan balik melalui dialog berdasarkan hasilnya.

- **Shared Preferences**:
  ```dart
  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }
  ```
  Fungsi ini menyimpan username ke penyimpanan permanen untuk digunakan di masa depan.

### Fungsi Keseluruhan:
Widget `LoginPage` ini menyediakan antarmuka yang ramah pengguna untuk melakukan login ke aplikasi, dilengkapi dengan animasi, validasi input, dan umpan balik kepada pengguna. Ini memanfaatkan `SharedPreferences` untuk menyimpan data pengguna secara lokal, memastikan pengalaman yang lancar di antara sesi-sesi yang berbeda.
