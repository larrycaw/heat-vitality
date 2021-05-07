import 'package:flutter/material.dart';
import 'package:heat_vitality/pages/glove_settings.dart';
import 'package:heat_vitality/pages/settings.dart';
import 'package:easy_localization/easy_localization.dart';

import 'bluetooth.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tilkoblede produkter
      // (Fremtidig forbedring: hente enheter fra liste generert fra tilkoblede enheter)
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'units'.tr(),
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.left,
            ),
            GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GloveSettings()), ).then((value) => setState(() {})),//Navigator.pushNamed(context, "/glove_settings"),
                child: Card(
                  elevation: 15,
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    const ListTile(
                        leading: Icon(Icons.album),
                        title: Text("Adrian's varmehanske"),
                        subtitle: Text("100% strøm"))
                  ]),
                ))
          ],
        ),
      ),
      // Navigasjonsbar på bunnen av siden
      bottomNavigationBar: BottomAppBar(
        child: Row(children: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()), ).then((value) => setState(() {})),//Navigator.pushNamed(context, "/settings"),
              color: Colors.white)
        ]),
        color: Color(0xFF6223EE)
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Bluetooth()), ).then((value) => setState(() {})),//Navigator.pushNamed(context, "/"),
          backgroundColor: Color(0xFF03DAC5),
          foregroundColor: Colors.black),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
