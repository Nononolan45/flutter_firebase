import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
class Firestore{
  final authStore = FirebaseAuth.instance;
  final dataStore = FirebaseFirestore.instance;



  //COnnexxion


  //Enregistrement des données

  Future enregistrement( String email, String pseudo, String pwd) async {

    final  resultat = await authStore.createUserWithEmailAndPassword(email: email, password: pwd);
    final user = resultat.user;
      String id = user!.uid;
      Map <String, dynamic> map = {
        "pseudo": pseudo,
        "email": email
      };
      addProfil(id, map);
    }


    Future  connexion (String email, String password) async {
      final resultat = await authStore.signInWithEmailAndPassword(email: email, password: password);
      final  user = resultat.user;


    return user;
    }



  void addProfil (String nom, Map <String, dynamic > map) {
      FirebaseFirestore.instance.collection('Profil').doc(nom).set(map);
  }
}