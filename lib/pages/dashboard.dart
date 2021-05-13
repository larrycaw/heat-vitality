import 'package:flutter/material.dart';
import 'package:heat_vitality/pages/settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heat_vitality/pages/bluetooth.dart';
import 'package:heat_vitality/classes/glove.dart';
import 'package:heat_vitality/icons/glove_icon_icons.dart';
import 'package:heat_vitality/variables/global_variables.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isConnected() {
    // See if any bt devices are registered on MyDevice
    for (Glove glove in gloves) {
      if (glove.isConnected) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    gloves = sharedPreference.getGloves;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // Tilkoblede produkter
        // (Fremtidig forbedring: hente enheter fra liste generert fra tilkoblede enheter)
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: isConnected()
              ? ListView(
                  children: [
                    Text(
                      'units'.tr(),
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      //textAlign: TextAlign.left,
                    ),
                    for (Glove glove in gloves)
                      if (glove.getIsConnected)
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            "/glove_settings",
                            arguments: <String, Glove>{
                              'glove': glove,
                            },
                          ).then((value) => setState(() {})),
                          child: Card(
                            elevation: 15,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                    leading: Container(
                                        child: Icon(
                                      GloveIcon.glove,
                                      size: 30.0,
                                    )),
                                    title: Text(glove.getName +
                                        "'s " +
                                        "heatGlove".tr()),
                                    subtitle: Text(glove.getBattery.toString() +
                                        "% " +
                                        "battery".tr())),
                              ],
                            ),
                          ),
                        ),
                  ],
                )
              : Center(
                  child: Text("connectToStart".tr(),
                      style: TextStyle(fontSize: 16)),
                ),
        ),
        // Navigasjonsbar på bunnen av siden
        bottomNavigationBar: BottomAppBar(
            child: Row(children: [
              IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()),
                      ).then((value) => setState(
                          () {})), //Navigator.pushNamed(context, "/settings"),
                  color: Colors.white)
            ]),
            color: Color(0xFF6223EE)),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bluetooth()),
                ).then((value) =>
                    setState(() {})), //Navigator.pushNamed(context, "/"),
            backgroundColor: Color(0xFF03DAC5),
            foregroundColor: Colors.black),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}
