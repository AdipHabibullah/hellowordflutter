import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_word/page/MAP/page_map_hybrid.dart';
import 'package:hello_word/page/MAP/page_map_multiple.dart';
import 'package:hello_word/page/MAP/page_map_normal.dart';
import 'package:hello_word/page/MAP/page_map_terrain.dart';
import 'package:hello_word/page/MAP/page_maps_dua.dart';

class PageMaps extends StatelessWidget {
  const PageMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Maps'), backgroundColor: Colors.green),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-0.9143211, 100.466),
          zoom: 17,
        ),
      ),
    );
  }
}

class PageMainMaps extends StatelessWidget {
  const PageMainMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Maps'), backgroundColor: Colors.green),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageMaps()),
                );
              },
              child: Text('Maps Pertama'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageMapsDua()),
                );
              },
              child: Text('Maps Kedua'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageMapNormal()),
                );
              },
              child: Text('Maps Normal'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageMapHybrid()),
                );
              },
              child: Text('Maps Hybrid'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageMapTerrain()),
                );
              },
              child: Text('Maps Terrain'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageMapMultiple()),
                );
              },
              child: Text('Maps Multiple Markers'),
            ),
          ],
        ),
      ),
    );
  }
}
