import 'package:flutter/material.dart';
import 'package:hello_word/models/model_albums.dart';

class PageDetailAlbums extends StatelessWidget {
  final ModelAlbums album;

  const PageDetailAlbums({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            album.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          Card(
            child: ListTile(
              leading: const Icon(Icons.music_note, color: Colors.greenAccent),
              title: const Text("Title"),
              subtitle: Text(album.title),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.greenAccent),
              title: const Text("User ID"),
              subtitle: Text(album.userId.toString()),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.confirmation_number, color: Colors.greenAccent),
              title: const Text("Album ID"),
              subtitle: Text(album.id.toString()),
            ),
          ),
        ],
      ),
    );
  }
}