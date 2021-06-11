import 'package:flutter/material.dart';
import 'package:firebase/pages/profil.dart';
import 'package:firebase/pages/inscription.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase/functions/Firestore.dart';
import 'globals.dart' as globals;




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Firebase'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  var email = "";
  var password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: body(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text('Menu',
              style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text('Profil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profil()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget body() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Center(
            child: TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (event){
                setState(() {
                    email = event;
                });
              },
            ),
          ),
          Center(
            child: TextField(
              decoration: InputDecoration(labelText: 'Mot de passe'),
              onChanged: (event){
                setState(() {
                  password = event;
                });
              },
            ),
          ),
          Center(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InscriptionPage()),
                    );
                  },
                  child: Text('S\'inscrire'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var user = await Firestore().connexion(email, password);
                   globals.user = user;
                  },
                  child: Text('Connexion'),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}





