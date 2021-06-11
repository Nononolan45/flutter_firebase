import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';


class AppBarBase extends StatefulWidget  implements PreferredSizeWidget {
  const AppBarBase({Key? key}) : super(key: key);

  @override
  _AppBarBaseState createState() => _AppBarBaseState();

  @override
  Size get preferredSize => new Size.fromHeight(50);
}

class _AppBarBaseState extends State<AppBarBase> {

  bool isSwitchOn = false;
  var colorAppBar = Colors.black;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(50);
}

