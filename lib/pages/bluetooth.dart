import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heat_vitality/widget_element/app_bar.dart';
import 'package:heat_vitality/widget_element/bluetooth_list_element.dart';
import 'package:heat_vitality/classes/glove.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heat_vitality/variables/global_variables.dart';

class Bluetooth extends StatefulWidget {
  @override
  _BluetoothState createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {

  void connectBluetoothDevice(Glove glove) {
    setState(() {
      glove.startConnecting();
    });
    Timer(Duration(seconds: 3), () {
      setState(() {
        glove.stopConnecting();
        glove.connect();
        print('Bt device connected');
        if(!glove.myDevice) {
          glove.addDeviceToMyDevices();
          print('Device added');
        }
      });
    });
  }

  void disconnectBluetoothDevice(Glove glove) {
    setState(() {
      glove.startConnecting();
    });
    Timer(Duration(seconds: 1), () {
      setState(() {
        glove.stopConnecting();
        glove.disconnect();
        print('Bt device disconnected');
      });
    });
  }

  void forgetMyDevice(Glove glove) {
    glove.removeDeviceFromMyDevices();
    disconnectBluetoothDevice(glove);
    print('Device forgotten');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        update: () => setState(() => print('Updated')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('myBluetoothDevices'.tr(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
              ],
            ),
          )),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 0, 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'myDevices'.tr(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              for (Glove glove in gloves)
                if (glove.getMyDeviceState)
                  BtListElement(
                    glove: glove,
                    onConnect: () => connectBluetoothDevice(glove),
                    onDisconnect: () => disconnectBluetoothDevice(glove),
                    onForgetDevice: () => setState(() => forgetMyDevice(glove)),
                    onUpdateBluetoothDevice: () => setState(() => print('Updated bt device')),
                  ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 80, 0, 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'otherDevices'.tr(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (Glove glove in gloves)
                  if (!glove.getMyDeviceState)
                    BtListElement(
                      glove: glove,
                      onConnect: () => connectBluetoothDevice(glove),
                      onDisconnect: () => disconnectBluetoothDevice(glove),
                      onUpdateBluetoothDevice: () => setState(() => print('Updated bt device')),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

