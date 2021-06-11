import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class chatPage extends StatefulWidget {
  const chatPage({Key? key}) : super(key: key);

  @override
  _chatPageState createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  @override
  List<String> listMesage = [];
  String message = "";
  bool isSwitchOn = false;
  var colorAppBar = Colors.black;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: colorAppBar,
        actions: [
          FlutterSwitch(
            value: isSwitchOn,
            onToggle: (value) {
              setState(() {
                isSwitchOn = value;
                if(!isSwitchOn){
                  colorAppBar = Colors.black;
                }
                else {
                  colorAppBar = Colors.red;
                }
              });
            },
          ),
        ],
      ),
      body: body(context),
    );
  }

  //Text('${listMesage[index]}')
  Widget body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              itemCount: listMesage.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text('${listMesage[index]}'),
                    )
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(labelText: ''),
                  maxLength: 100,
                  onChanged: (event) {
                    setState(() {
                      setState(() {
                        message = event;
                      });
                    });
                  },
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      listMesage.add(message);
                      message = "";
                    });
                  },
                  icon: Icon(Icons.send_rounded))
            ],
          ),
        ],
      ),
    );
  }
}
