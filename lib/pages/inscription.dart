import 'package:flutter/material.dart';
class Inscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription"),
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
            child: TextField(
              decoration: InputDecoration(labelText: 'Pseudo'),
            ),
          ),
          Center(
            child: TextField(
              decoration: InputDecoration(labelText: 'Mot de passe'),
            ),
          ),
          Center(
            child: TextField(
              decoration: InputDecoration(labelText: 'Mail'),
            ),
          ),
          Center(
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text('S\'inscrire'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
