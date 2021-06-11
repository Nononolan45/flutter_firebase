import 'package:flutter/material.dart';
import 'package:firebase/globals.dart' as globals;

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
    print(globals.user);
    if(globals.user == Null){
      return Center(
        child: Text('Vous n\'etes pas connecter'),
      );
    }
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Center(
              child: Text('Uid : ${globals.user.uid}')
          ),
          Center(
              child: Text('Email : ${globals.user.email}')
          ),
        ],
      ),
    );
  }
}