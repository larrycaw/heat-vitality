import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hexcolor/hexcolor.dart';

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
                onTap: () => Navigator.pushNamed(context, "/glove_settings"),
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
              onPressed: () => Navigator.pushNamed(context, "/settings"),
              color: Colors.white)
        ]),
        color: HexColor("#6223EE"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, "/"),
          backgroundColor: HexColor("#03DAC5"),
          foregroundColor: Colors.black),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
