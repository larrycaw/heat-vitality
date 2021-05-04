import 'package:flutter/material.dart';
//import 'package:easy_localization/easy_localization.dart';

class GloveSettings extends StatefulWidget {
  @override
  _GloveSettingsState createState() => _GloveSettingsState();
}

// kilder:
// https://flutter.dev/docs/cookbook/design/tabs
class _GloveSettingsState extends State<GloveSettings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [Tab(text: "Standarder"), Tab(text: "Tilpasset")],
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context), //denne må rettes
                ),
              ),

              //Tab-innhold
              body: TabBarView(
                children: [
                  Text("Trinnmeny"), //add radio-menu here
                  Text("Tilpasset") //add custom slider here
                ],
              ),
            )));
  }
}
