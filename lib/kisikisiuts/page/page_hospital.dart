import 'package:flutter/material.dart';
import 'package:hello_word/kisikisiuts/model/hospital.dart';
import 'package:hello_word/kisikisiuts/page/page_detail_hospital.dart';

class PageHospital extends StatefulWidget {
  const PageHospital({super.key});

  @override
  State<PageHospital> createState() => _PageHospitalState();
}

class _PageHospitalState extends State<PageHospital> {
  List<Map<String, dynamic>> hospital = [
    {
      "title": "RSUP Dr. M. Djamil Padang",
      "image": "images/gambar2.jpeg",
      "desc": "Rumah sakit rujukan pusat tipe A",
      "latitude": -0.9143211,
      "longitude": 100.466
    },
    {
      "title": "Semen Padang Hospital",
      "image": "images/gambar2.jpeg",
      "desc": "Rumah sakit swasta dengan fasilitas modern",
      "latitude": -0.9201234,
      "longitude": 100.372
    },
    {
      "title": "RS Hermina Padang",
      "image": "images/gambar2.jpeg",
      "desc": "Rumah sakit ibu, anak, dan umum",
      "latitude": -0.9056789,
      "longitude": 100.355
    },
    {
      "title": "RS Islam Ibnu Sina Padang",
      "image": "images/gambar2.jpeg",
      "desc": "Rumah sakit swasta terkemuka",
      "latitude": -0.9287654,
      "longitude": 100.480
    },
    {
      "title": "RSUD dr. Rasidin Padang",
      "image": "images/gambar2.jpeg",
      "desc": "Rumah sakit pemerintah tipe C",
      "latitude": -0.9123456,
      "longitude": 100.360
    },
    {
      "title": "Rumah Sakit Universitas Andalas (UNAND)",
      "image": "images/gambar2.jpeg",
      "desc": "Rumah sakit pendidikan",
      "latitude": -0.9354321,
      "longitude": 100.410
    }
  ];

  List<Map<String, dynamic>> filteredHospital = [];
  TextEditingController txtSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredHospital = hospital;
  }

  //Fitur Search
  void searchHospital(String keyword) {
    final results = hospital.where((item) {
      final title = item['title'].toLowerCase();
      final input = keyword.toLowerCase();

      return title.contains(input);
    }).toList();

    setState(() {
      filteredHospital = results;
    });
  }

  //ketika klik item di list maka akan diarahkan ke detail
  void navigateToDetail(Map<String, dynamic> item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageDetailHospital(
          hospital: Hospital.fromJson(item),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rumah Sakit Daerah Kota Padang"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: txtSearch,
              decoration: InputDecoration(
                hintText: "Cari nama rumah sakit...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                searchHospital(value);
              },
            ),
            SizedBox(height: 12),
            Expanded(
              child: filteredHospital.isEmpty
                  ? Center(child: Text("rumah sakit tidak ditemukan"))
                  : GridView.builder(
                itemCount: filteredHospital.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final item = filteredHospital[index];
                  return GestureDetector(
                    onTap: () => navigateToDetail(item),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            child: Image.asset(
                              item['image'],
                              width: double.infinity,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              item['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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