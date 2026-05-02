import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class PageMapMultiple extends StatefulWidget {
  const PageMapMultiple({super.key});

  @override
  State<PageMapMultiple> createState() => _PageMapMultipleState();
}

class _PageMapMultipleState extends State<PageMapMultiple> {
  final Set<Marker> _markers = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(Marker(
      markerId: MarkerId("pnp"),
      position: LatLng(-0.9143211, 100.466),
      infoWindow: InfoWindow(title: "Politeknik Negeri Padang", snippet: "Limau Manis, Pauh"),
    ));

    _markers.add(Marker(
      markerId: MarkerId("unand"),
      position: LatLng(-0.916, 100.463),
      infoWindow: InfoWindow(title: "Universitas Andalas (UNAND)", snippet: "Limau Manis, Pauh"),
    ));

    _markers.add(Marker(
      markerId: MarkerId("unp"),
      position: LatLng(-0.876, 100.359),
      infoWindow: InfoWindow(title: "Universitas Negeri Padang (UNP)", snippet: "Air Tawar Barat, Padang Utara"),
    ));

    _markers.add(Marker(
      markerId: MarkerId("ubh"),
      position: LatLng(-0.893, 100.355),
      infoWindow: InfoWindow(title: "Universitas Bung Hatta (UBH)", snippet: "Ulak Karang, Padang"),
    ));

    _markers.add(Marker(
      markerId: MarkerId("unidha"),
      position: LatLng(-0.925, 100.375),
      infoWindow: InfoWindow(title: "Universitas Dharma Andalas (UNIDHA)", snippet: "Sawahan, Padang Timur"),
    ));

    _markers.add(Marker(
      markerId: MarkerId("unes"),
      position: LatLng(-0.905, 100.369),
      infoWindow: InfoWindow(title: "Universitas Ekasakti (UNES)", snippet: "Gunung Pangilun, Padang Utara"),
    ));

    _markers.add(Marker(
      markerId: MarkerId("unbrah"),
      position: LatLng(-0.855, 100.375),
      infoWindow: InfoWindow(title: "Universitas Baiturrahmah (UNBRAH)", snippet: "Aie Pacah, Koto Tangah"),
    ));

    _markers.add(Marker(
      markerId: MarkerId("umsb"),
      position: LatLng(-0.850, 100.345),
      infoWindow: InfoWindow(title: "Universitas Muhammadiyah Sumatera Barat (UMSB)", snippet: "Pasie Nan Tigo, Koto Tangah"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(-0.9143211, 100.466),
        zoom: 15,
      ),
      mapType: .normal,
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
