import 'package:flutter/material.dart';
import 'package:hello_word/models/model_berita.dart';

class PageDetailBerita extends StatelessWidget {
  final Datum berita;

  const PageDetailBerita({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(berita.judul),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "http://10.20.31.48/berita_api/gambar/${berita.gambarBerita}",
            webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                berita.judul,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 18,
                  color: Colors.blue,
                ),
                const SizedBox(width: 4),
                Text(
                  "tanggal berita ${berita.tglBerita.day}-${berita.tglBerita.month}-${berita.tglBerita.year}",
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              berita.isiBerita,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}