import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // default is 56.0
  final VoidCallback update;

  CustomAppBar({Key key, this.update})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          onPressed: () async {
            print('Go to settings');
            await Navigator.pushNamed(context, "/settings");
            print('Back from settings');
            this.widget.update();
          },
        ),
      ],
    );
  }
}
