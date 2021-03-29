import 'package:flutter/material.dart';



class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}


class _CustomAppBarState extends State<CustomAppBar>{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      /*title: Text(
        'HeatVitality',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),*/
      centerTitle: true,
      backgroundColor: Color(0XFF571fe4),
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.speed),
          tooltip: 'Go to dashboard',
          onPressed: () {
            print('Go to dashboard');
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Go to settings',
          onPressed: () {
            print('Go to settings');
            Navigator.pushNamed(context, "/settings");
          },
        ),
      ],
    );
  }
}