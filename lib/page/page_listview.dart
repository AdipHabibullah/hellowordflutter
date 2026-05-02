import 'package:flutter/material.dart';

class PageListview extends StatelessWidget {
  const PageListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Page List View"),
      ),
        body: ListView(
          children: [

            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            SizedBox(height: 10,),// spase ke bawah atau vertical
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            SizedBox(height: 10,),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
            SizedBox(height: 10,),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            )
          ],
        )
    );
  }
}
