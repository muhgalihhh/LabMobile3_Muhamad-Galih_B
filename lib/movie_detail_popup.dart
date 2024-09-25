import 'package:flutter/material.dart';

class MovieDetailPopup extends StatelessWidget {
  final Map<String, dynamic> movie;

  const MovieDetailPopup({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Sudut membulat untuk dialog
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie['title'],
              style: const TextStyle(
                fontFamily: 'Lexend', // Menggunakan font Lexend
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Warna judul
              ),
            ),
            const SizedBox(height: 10),
            movie['poster_path'] != null
                ? ClipRRect(
                    borderRadius:
                        BorderRadius.circular(8), // Sudut membulat untuk gambar
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${movie['poster_path']}',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(Icons.movie,
                    size: 100, color: Colors.black), // Warna ikon
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.black54),
                const SizedBox(width: 5),
                Text(
                  'Tanggal Rilis: ${movie['release_date']}',
                  style: const TextStyle(
                    fontFamily: 'Lexend', // Menggunakan font Lexend
                    color: Colors.black54,
                  ), // Teks lebih ringan untuk info
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.star,
                    color: Colors.amber), // Ikon bintang untuk rating
                const SizedBox(width: 5),
                Text(
                  'Rating: ${movie['vote_average']}/10',
                  style: const TextStyle(
                    fontFamily: 'Lexend', // Menggunakan font Lexend
                    color: Colors.black54,
                  ), // Teks lebih ringan untuk info
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Membungkus deskripsi dalam SingleChildScrollView
            SingleChildScrollView(
              child: Text(
                movie['overview'],
                style: const TextStyle(
                  fontFamily: 'Lexend', // Menggunakan font Lexend
                  fontSize: 14,
                  color: Colors.black,
                ), // Warna teks deskripsi
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Tutup',
                  style: TextStyle(
                    fontFamily: 'Lexend', // Menggunakan font Lexend
                    color: Colors.black, // Warna tombol tutup
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
