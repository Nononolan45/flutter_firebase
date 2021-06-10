import 'package:flutter/material.dart';


class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        backgroundColor: Colors.black,
      ),
      body: body(),
    );
  }
  Widget body() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Center(
              child: Text('Mon profil')
          ),
        ],
      ),
    );
  }
}