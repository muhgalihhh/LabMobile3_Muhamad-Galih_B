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

## HomePage
Berikut adalah penjelasan tentang kode Flutter dalam kelas `HomePage`, yang berfungsi sebagai halaman utama aplikasi pencarian film:

### Komponen Utama:

1. **Import**:
   - `flutter/material.dart`: Pustaka inti Flutter untuk desain material.
   - `modul_3/search_film.dart`: Halaman untuk pencarian film yang akan dinavigasi dari halaman ini.
   - `modul_3/side_menu.dart`: Menu samping (drawer) untuk navigasi tambahan.
   - `shared_preferences/shared_preferences.dart`: Pustaka untuk menyimpan dan mengambil data sederhana dalam bentuk pasangan kunci-nilai.

2. **Widget Stateful**:
   - `HomePage` adalah subclass dari `StatefulWidget` yang mempertahankan status dari halaman utama.

3. **Variabel `namauser`**:
   - Variabel ini menyimpan nama pengguna yang diambil dari penyimpanan lokal.

4. **Metode `initState`**:
   - Metode ini dipanggil saat halaman diinisialisasi dan memanggil fungsi `_loadUsername` untuk mengambil nama pengguna yang tersimpan.

5. **Fungsi `_loadUsername`**:
   - Fungsi ini menginisialisasi `SharedPreferences` dan mengambil username yang tersimpan. Jika ditemukan, username disimpan dalam variabel `namauser`, dan UI diperbarui dengan `setState`.

6. **Metode `build`**:
   - Metode ini mendefinisikan struktur UI halaman, termasuk AppBar, ikon, teks sambutan, dan tombol untuk mencari film.

### Penjelasan Segmen Kode Penting:

- **Inisialisasi Shared Preferences**:
  ```dart
  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namauser = prefs.getString('username');
    });
  }
  ```
  Fungsi ini bertanggung jawab untuk memuat nama pengguna yang telah disimpan sebelumnya ke dalam variabel `namauser`.

- **Struktur UI**:
  ```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pencarian Film'),
        ...
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.tv,
                ...
              ),
              ...
              Text(
                'Hai, ${namauser ?? "Pengguna"}!',
                ...
              ),
              ...
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchFilm()),
                  );
                },
                ...
              ),
            ],
          ),
        ),
      ),
      drawer: const SideMenu(),
    );
  }
  ```
  Metode ini mendefinisikan tampilan utama dari halaman, termasuk penggunaan `AppBar` untuk judul aplikasi, `Icon` untuk simbol visual, dan `Text` untuk menyapa pengguna dengan nama mereka.

- **Navigasi ke Halaman Pencarian Film**:
  ```dart
  ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchFilm()),
      );
    },
    ...
  )
  ```
  Tombol ini mengarahkan pengguna ke halaman pencarian film ketika ditekan.

### Fungsi Keseluruhan:
Widget `HomePage` ini menyediakan antarmuka yang ramah pengguna untuk halaman utama aplikasi pencarian film. Halaman ini menyambut pengguna dengan nama mereka, mengarahkan mereka ke fitur pencarian film, dan menampilkan menu samping untuk navigasi tambahan. Penggunaan `SharedPreferences` memastikan bahwa nama pengguna disimpan dan ditampilkan dengan baik di halaman.

## AboutPage
Berikut adalah penjelasan tentang kode Flutter dalam kelas `AboutPage`, yang berfungsi sebagai halaman tentang aplikasi pencarian film:

### Komponen Utama:

1. **Import**:
   - `flutter/material.dart`: Pustaka inti Flutter untuk desain material.
   - `modul_3/side_menu.dart`: Halaman menu samping (drawer) untuk navigasi tambahan.

2. **Widget Stateless**:
   - `AboutPage` adalah subclass dari `StatelessWidget`, yang berarti halaman ini tidak memiliki status yang berubah.

3. **Metode `build`**:
   - Metode ini mendefinisikan struktur UI halaman, termasuk AppBar, konten tentang aplikasi, dan menu samping untuk navigasi tambahan.

### Penjelasan Segmen Kode Penting:

- **Struktur Umum Halaman**:
  ```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Halaman Tentang'),
        ...
      ),
      ...
      drawer: SideMenu(),
    );
  }
  ```
  Metode `build` ini mengatur tampilan utama halaman dengan `Scaffold`, yang menyertakan `AppBar`, body konten, dan `drawer` untuk menu samping.

- **AppBar**:
  ```dart
  appBar: AppBar(
    title: const Text('Halaman Tentang'),
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  )
  ```
  AppBar berfungsi sebagai bilah navigasi di bagian atas halaman dengan judul "Halaman Tentang", menggunakan latar belakang putih dan teks hitam.

- **Konten Halaman**:
  ```dart
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tentang Aplikasi',
            ...
          ),
          const Text(
            'Aplikasi ini dirancang untuk membantu pengguna mencari film dengan mudah...',
            ...
          ),
          ...
        ],
      ),
    ),
  )
  ```
  Body halaman menggunakan `SingleChildScrollView` untuk memungkinkan penggulangan jika konten melebihi tinggi layar. Konten ini dibungkus dalam `Padding` untuk memberikan ruang di sekitar konten.

- **Judul dan Deskripsi**:
  ```dart
  const Text(
    'Tentang Aplikasi',
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Lexend',
      color: Colors.black,
    ),
  )
  ```
  Teks judul dan deskripsi menjelaskan tujuan aplikasi, diatur dengan gaya teks yang jelas.

- **Fitur Utama**:
  ```dart
  const Text(
    'Fitur Utama:',
    ...
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      ListTile(
        leading: Icon(Icons.search, color: Colors.black54),
        title: Text('Mencari film berdasarkan judul'),
      ),
      ...
    ],
  )
  ```
  Fitur-fitur aplikasi disajikan dalam bentuk `ListTile`, yang menyediakan deskripsi singkat tentang kemampuan aplikasi. Masing-masing `ListTile` memiliki ikon dan teks yang menunjukkan fungsionalitasnya.

- **Informasi Pengembang**:
  ```dart
  const Text(
    'Dikembangkan oleh:',
    ...
  ),
  const Text(
    'Muhamad Galih\n'
    'muhamad.galih@mhs.unsoed.ac.id\n'
    'Tahun 2024',
    ...
  )
  ```
  Bagian ini menyajikan informasi tentang pengembang aplikasi, termasuk nama, alamat email, dan tahun pengembangan.

### Fungsi Keseluruhan:
Widget `AboutPage` ini memberikan informasi penting tentang aplikasi, menjelaskan tujuan, fitur, dan informasi pengembang. Halaman ini dirancang dengan antarmuka yang bersih dan responsif, serta memudahkan pengguna untuk memahami lebih lanjut tentang aplikasi pencarian film yang mereka gunakan. Desain yang sederhana dengan penggunaan `ListTile` dan teks terstruktur membuat informasi mudah dibaca dan dinavigasi.

## SearchFilm
Berikut adalah penjelasan dengan sorotan pada bagian kode penting dari kelas `SearchFilm` dalam aplikasi Flutter:

### Kelas SearchFilm

```dart
class SearchFilm extends StatefulWidget {
  const SearchFilm({Key? key}) : super(key: key);

  @override
  State<SearchFilm> createState() => _SearchFilmState();
}
```
- **Kelas SearchFilm**: Merupakan widget yang dapat mempertahankan state, memudahkan interaksi pengguna untuk mencari film.

### Pengendali Teks dan Hasil Pencarian

```dart
final TextEditingController _searchController = TextEditingController();
List<dynamic> _searchResults = [];
```
- **_searchController**: Mengelola input teks dari pengguna untuk pencarian film.
- **_searchResults**: Menyimpan hasil pencarian film yang diperoleh dari API.

### Fungsi Pencarian Film

```dart
Future<void> _searchMovies(String query) async {
  final String apiKey = 'a32e68858c829a3117edef7c3aee0d80';
  final String baseUrl = 'https://api.themoviedb.org/3';
  final response = await http.get(
    Uri.parse('$baseUrl/search/movie?api_key=$apiKey&query=$query'),
  );

  if (response.statusCode == 200) {
    setState(() {
      _searchResults = json.decode(response.body)['results'];
    });
  } else {
    throw Exception('Gagal memuat film');
  }
}
```
- **_searchMovies**: Fungsi yang mengirim permintaan ke API TMDb untuk mendapatkan film berdasarkan kueri pencarian. 
- **setState**: Memperbarui UI dengan hasil pencarian setelah berhasil mendapatkan data.

### Menampilkan Detail Film

```dart
void _showMovieDetail(BuildContext context, Map<String, dynamic> movie) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return MovieDetailPopup(movie: movie);
    },
  );
}
```
- **_showMovieDetail**: Fungsi untuk menampilkan dialog pop-up yang berisi detail film yang dipilih.

### Struktur UI

```dart
return Scaffold(
  appBar: AppBar(
    title: const Text(
      'Cari Film',
      style: TextStyle(fontFamily: 'Lexend'),
    ),
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 2,
  ),
  body: Container(
    color: Colors.white,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              labelText: 'Cari film',
              labelStyle: const TextStyle(
                color: Colors.black54,
                fontFamily: 'Lexend',
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  _searchMovies(_searchController.text);
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            onSubmitted: (value) {
              _searchMovies(value);
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              final movie = _searchResults[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(
                    movie['title'],
                    style: const TextStyle(color: Colors.black, fontFamily: 'Lexend'),
                  ),
                  subtitle: Text(
                    movie['release_date'],
                    style: const TextStyle(color: Colors.black54, fontFamily: 'Lexend'),
                  ),
                  leading: movie['poster_path'] != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${movie['poster_path']}',
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(Icons.movie, color: Colors.black),
                  onTap: () => _showMovieDetail(context, movie),
                ),
              );
            },
          ),
        ),
      ],
    ),
  ),
  drawer: const SideMenu(),
);
```
- **Scaffold**: Kerangka dasar untuk halaman dengan `AppBar`, `body`, dan `drawer`.
- **TextField**: Input untuk pencarian film, dengan pengaturan `suffixIcon` untuk memicu pencarian.
- **ListView.builder**: Menampilkan daftar hasil pencarian film dalam bentuk kartu, di mana setiap kartu memiliki judul, tanggal rilis, dan poster film.
- **onTap**: Menangani interaksi ketika film diketuk untuk menampilkan detail film.

### Ringkasan

Kelas `SearchFilm` memungkinkan pengguna untuk:
- Menginput pencarian film.
- Melakukan pencarian dengan API dan menampilkan hasilnya dalam daftar.
- Melihat detail film dalam dialog pop-up ketika item daftar diketuk.

Dengan desain yang bersih dan intuitif, kelas ini memberikan pengalaman pengguna yang baik dalam mencari dan meneliti film.

## MovieDetailPopup
Berikut adalah penjelasan mengenai kelas `MovieDetailPopup`, yang merupakan dialog pop-up untuk menampilkan detail film dalam aplikasi Flutter:

### Penjelasan Kode

#### Definisi Kelas
```dart
class MovieDetailPopup extends StatelessWidget {
  final Map<String, dynamic> movie;

  const MovieDetailPopup({Key? key, required this.movie}) : super(key: key);
```
- Kelas ini merupakan widget stateless yang menerima parameter `movie`, berupa peta (map) dengan detail film.

#### Struktur Dialog
```dart
return Dialog(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
```
- Dialog diatur dengan sudut membulat menggunakan `RoundedRectangleBorder`.

#### Konten Dialog
```dart
child: Container(
  padding: const EdgeInsets.all(16),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Judul film
      Text(
        movie['title'],
        style: const TextStyle(
          fontFamily: 'Lexend',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
```
- Konten dialog terdiri dari beberapa bagian, termasuk:
  - **Judul Film**: Menampilkan nama film dengan ukuran dan gaya font yang ditentukan.

#### Gambar Poster Film
```dart
movie['poster_path'] != null
  ? ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        'https://image.tmdb.org/t/p/w500/${movie['poster_path']}',
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    )
  : const Icon(Icons.movie, size: 100, color: Colors.black),
```
- Jika `poster_path` tersedia, gambar poster ditampilkan. Jika tidak, ikon film default ditampilkan.

#### Tanggal Rilis dan Rating
```dart
Row(
  children: [
    const Icon(Icons.calendar_today, color: Colors.black54),
    const SizedBox(width: 5),
    Text(
      'Tanggal Rilis: ${movie['release_date']}',
      style: const TextStyle(
        fontFamily: 'Lexend',
        color: Colors.black54,
      ),
    ),
  ],
),
Row(
  children: [
    const Icon(Icons.star, color: Colors.amber),
    const SizedBox(width: 5),
    Text(
      'Rating: ${movie['vote_average']}/10',
      style: const TextStyle(
        fontFamily: 'Lexend',
        color: Colors.black54,
      ),
    ),
  ],
),
```
- Informasi tambahan tentang film, termasuk tanggal rilis dan rating, ditampilkan dalam baris terpisah dengan ikon terkait.

#### Deskripsi Film
```dart
SingleChildScrollView(
  child: Text(
    movie['overview'],
    style: const TextStyle(
      fontFamily: 'Lexend',
      fontSize: 14,
      color: Colors.black,
    ),
  ),
),
```
- Deskripsi film dibungkus dalam `SingleChildScrollView` untuk memungkinkan scrolling jika deskripsi terlalu panjang.

#### Tombol Tutup
```dart
Align(
  alignment: Alignment.centerRight,
  child: TextButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: const Text(
      'Tutup',
      style: TextStyle(
        fontFamily: 'Lexend',
        color: Colors.black,
      ),
    ),
  ),
),
```
- Tombol 'Tutup' yang memungkinkan pengguna untuk menutup dialog pop-up. Ketika ditekan, dialog akan ditutup menggunakan `Navigator.of(context).pop()`.

### Ringkasan
Kelas `MovieDetailPopup` digunakan untuk menampilkan informasi detail film, termasuk judul, gambar poster, tanggal rilis, rating, dan deskripsi film. Dialog ini dirancang untuk memberikan pengalaman pengguna yang baik dengan penggunaan tata letak dan styling yang sesuai.

