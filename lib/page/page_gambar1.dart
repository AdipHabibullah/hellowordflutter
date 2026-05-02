import 'package:flutter/material.dart';

class PageGambar1 extends StatelessWidget {
  const PageGambar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rumah Gadang"),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Image.asset("images/gambar1.jpeg"),
      ),
    );
  }
}