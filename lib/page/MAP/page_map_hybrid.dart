import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class PageMapHybrid extends StatefulWidget {
  const PageMapHybrid({super.key});

  @override
  State<PageMapHybrid> createState() => _PageMapHybridState();
}

class _PageMapHybridState extends State<PageMapHybrid> {
  final Set<Marker> _markers = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(
      Marker(
        markerId: const MarkerId("Campus"),
        position: LatLng(-0.9143211, 100.466),
        infoWindow: InfoWindow(title: "Kampus PNP"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(-0.9143211, 100.466),
        zoom: 15,
      ),
      mapType: .hybrid,
      markers: _markers,
    );
  }
}
//tambahkan beberapa page untuk maps
//1. Buat maps tipe satellite
//2. Buat maps normal
//3. Buat maps yang hybrid
//4. Buat maps yang terrain
//5. Bikin maps dengan multiple markers(PNP, Unand, UNP dll)
