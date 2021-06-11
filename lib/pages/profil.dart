import 'package:flutter/material.dart';
import 'package:firebase/globals.dart' as globals;
import 'package:firebase/pages/AppBar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:file_picker/file_picker.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override

  //File file;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBase(),
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
            child: displayImage(),
          ),
          Center(
              child: Text('Uid : ${globals.user.uid}')
          ),
          Center(
              child: Text('Email : ${globals.user.email}')
          ),
          Center(
              child: ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();

                  if(result != null) {
                    setState(() {
                      globals.isImageNetwork = false;

                    });
                  } else {
                    setState(() {
                      //file = result.files.single.path);
                      globals.isImageNetwork = true;
                    });
                  }

                },
                child: Text('Changer photo'),
              )
          )
        ],
      ),
    );
  }

  Widget displayImage(){
    if(globals.isImageNetwork){
      return Image.network(globals.imageUser);
    }
    return Text('Pas fini de developper');
    // return Image.file(file);
  }
}





