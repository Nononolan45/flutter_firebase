import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';


dynamic AppBar(
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