import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'movie_detail_popup.dart'; // Impor file baru
import 'side_menu.dart'; // Impor file baru

class SearchFilm extends StatefulWidget {
  const SearchFilm({Key? key}) : super(key: key);

  @override
  State<SearchFilm> createState() => _SearchFilmState();
}

class _SearchFilmState extends State<SearchFilm> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];

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

  void _showMovieDetail(BuildContext context, Map<String, dynamic> movie) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MovieDetailPopup(movie: movie);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cari Film',
          style: TextStyle(fontFamily: 'Lexend'), // Menggunakan font Lexend
        ),
        backgroundColor: Colors.white, // Warna latar belakang AppBar
        foregroundColor: Colors.black, // Warna teks AppBar
        elevation: 2, // Bayangan AppBar
      ),
      body: Container(
        color: Colors.white, // Latar belakang body berwarna putih
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors
                      .grey[200], // Latar belakang TextField yang lebih terang
                  labelText: 'Cari film',
                  labelStyle: const TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Lexend', // Menggunakan font Lexend
                  ), // Warna label
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search,
                        color: Colors.black), // Warna ikon
                    onPressed: () {
                      _searchMovies(_searchController.text);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300), // Warna batas input
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
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    color: Colors.white, // Latar belakang kartu film
                    elevation: 2, // Bayangan kartu
                    child: ListTile(
                      title: Text(
                        movie['title'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lexend', // Menggunakan font Lexend
                        ), // Warna teks judul
                      ),
                      subtitle: Text(
                        movie['release_date'],
                        style: const TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Lexend', // Menggunakan font Lexend
                        ), // Warna teks subtitel
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
                          : const Icon(Icons.movie,
                              color: Colors.black), // Ikon film
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
  }
}
