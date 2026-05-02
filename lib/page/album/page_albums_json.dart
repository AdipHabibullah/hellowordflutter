import 'package:flutter/material.dart';
import 'package:hello_word/models/model_albums.dart';
import 'package:hello_word/page/album/page_detail_albums.dart';
import 'package:hello_word/services/api_service.dart';

class PageAlbumsJson extends StatefulWidget {
  const PageAlbumsJson({super.key});

  @override
  State<PageAlbumsJson> createState() => _PageAlbumsJsonState();
}

class _PageAlbumsJsonState extends State<PageAlbumsJson> {
  late Future<List<ModelAlbums>> futureAlbums;
  List<ModelAlbums> allAlbums = [];
  List<ModelAlbums> filteredAlbums = [];
  TextEditingController txtSearch = TextEditingController();
  bool isGrid = false; // toggle view

  @override
  void initState() {
    super.initState();
    futureAlbums = ApiService.fetchDataAlbums(); // Pastikan method ini ada di ApiService
  }

  void searchAlbums(String keyword) {
    final results = allAlbums.where((album) {
      final title = album.title.toLowerCase();
      final input = keyword.toLowerCase();
      return title.contains(input);
    }).toList();

    setState(() {
      filteredAlbums = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Albums Json"),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            icon: Icon(isGrid ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<ModelAlbums>>(
        future: futureAlbums,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Terjadi Kesalahan Load Data"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Data Kosong"));
          }

          if (allAlbums.isEmpty) {
            allAlbums = snapshot.data!;
            filteredAlbums = allAlbums;
          }

          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: txtSearch,
                  decoration: InputDecoration(
                    hintText: "Cari judul album...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) => searchAlbums(value),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: filteredAlbums.isEmpty
                      ? const Center(child: Text("Album tidak ditemukan"))
                      : isGrid
                      ? buildGridView()
                      : buildListView(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: filteredAlbums.length,
      itemBuilder: (context, index) {
        final album = filteredAlbums[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          child: ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageDetailAlbums(album: album),
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: Text(
                album.title[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              album.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text("User ID: ${album.userId}",
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.music_note, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text("ID: ${album.id}",
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      itemCount: filteredAlbums.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final album = filteredAlbums[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageDetailAlbums(album: album),
            ),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.greenAccent,
                    child: const Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    album.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.greenAccent,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person, size: 14, color: Colors.grey),
                      const SizedBox(width: 2),
                      Text(
                        "User ${album.userId}",
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}