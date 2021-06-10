import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class User {
      var pseudo = "";
      String email = "";
      String uid = "";
      String image = "";

      User(DocumentSnapshot snapshot){
            uid = snapshot.id;
            var maMap = snapshot.data();
            pseudo = maMap['pseudo'];
            email = maMap['email'];
            image = maMap['image'];

      }
}