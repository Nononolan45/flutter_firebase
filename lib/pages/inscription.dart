import 'package:firebase/functions/Firestore.dart';
import 'package:flutter/material.dart';


class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {

  var pseudo = "";
  var email = "";
  var password = "";
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
              onChanged: (event) {
                setState((){
                  pseudo = event;
                });
              },
            ),
          ),
          Center(
            child: TextField(
              decoration: InputDecoration(labelText: 'Mot de passe'),
              onChanged: (event) {
                setState((){
                  password = event;
                });
              },
            ),
          ),
          Center(
            child: TextField(
              decoration: InputDecoration(labelText: 'Mail'),
              onChanged: (event) {
                setState((){
                  email = event;
                });
              },
            ),
          ),
          Center(
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  print(pseudo);
                  Firestore().enregistrement(email, pseudo, password);
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
