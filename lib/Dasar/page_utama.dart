import 'package:flutter/material.dart';
import 'package:hello_word/kisikisiuts/page/page_hospital.dart';
import 'package:hello_word/page/album/page_albums_json.dart';
import 'package:hello_word/page/form_register.dart';
import 'package:hello_word/page/page_gambar1.dart';
import 'package:hello_word/page/page_gambar2.dart';
import 'package:hello_word/page/page_home_movie.dart';
import 'package:hello_word/page/page_list_berita.dart';
import 'package:hello_word/page/page_listview.dart';
import 'package:hello_word/page/MAP/page_maps.dart';
import 'package:hello_word/page/page_movie_grid.dart';
import 'package:hello_word/page/page_photos_json.dart';
import 'package:hello_word/page/page_row_column.dart';
import 'package:hello_word/page/page_simple_form.dart';
import 'package:hello_word/page/page_stack.dart';
import 'package:hello_word/page/page_users_json.dart';

class PageUtama extends StatelessWidget {
  const PageUtama({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Page Stack',
        'icon': Icons.layers_rounded,
        'color': Colors.red,
        'page': const PageStack(),
      },
      {
        'title': 'Page Row',
        'icon': Icons.table_rows_rounded,
        'color': Colors.amber,
        'page': const PageRowColumn(),
      },
      {
        'title': 'Page Column',
        'icon': Icons.view_column_rounded,
        'color': Colors.green,
        'page': const PageColumn(),
      },
      {
        'title': 'List View',
        'icon': Icons.format_list_bulleted_rounded,
        'color': Colors.red,
        'page': const PageListview(),
      },
      {
        'title': 'Simple Form',
        'icon': Icons.edit_note_rounded,
        'color': Colors.amber,
        'page': const PageSimpleForm(),
      },
      {
        'title': 'Register',
        'icon': Icons.person_add_rounded,
        'color': Colors.green,
        'page': const FormRegister(),
      },
      {
        'title': 'Movie App',
        'icon': Icons.movie_rounded,
        'color': Colors.blue,
        'page': const PageHomeMovie(),
      },
      {
        'title': 'Movie Grid',
        'icon': Icons.grid_view_rounded,
        'color': Colors.purple,
        'page': const PageMovieGrid(),
      },
      {
        'title': 'Photos',
        'icon': Icons.photo_library_rounded,
        'color': Colors.teal,
        'page': const PagePhotosJson(),
      },
      {
        'title': 'Users',
        'icon': Icons.group_rounded,
        'color': Colors.deepOrange,
        'page': const PageUsersJson(),
      },
      {
        'title': 'Maps',
        'icon': Icons.map,
        'color': Colors.pinkAccent,
        'page': const PageMainMaps(),
      },
      {
        'title': 'Hospital',
        'icon': Icons.local_hospital,
        'color': Colors.redAccent,
        'page': const PageHospital(),
      },
      {
        'title': 'Albums',
        'icon': Icons.album,
        'color': Colors.blue,
        'page': const PageAlbumsJson(),
      },
      {
        'title': 'Berita',
        'icon': Icons.new_label,
        'color': Colors.pinkAccent,
        'page': const PageListBerita(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MI 2 A PNP',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: SizedBox(
        width: 250,
        child: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Adip'),
                accountEmail: Text('riyiknjir@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.person, color: Colors.green, size: 40),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Photo 1'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PageGambar1())),
              ),
              ListTile(
                leading: const Icon(Icons.photo_album),
                title: const Text('Photo 2'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PageGambar2())),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.freepik.com/free-vector/reggae-style-background_23-2147970790.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Selamat Datang di Apps Pertama MI 2A by ADIP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => item['page']),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: (item['color'] as Color),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              item['icon'] as IconData,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['title'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}