import 'dart:async';

import 'package:flutter/material.dart';
import 'package:glove_control/widget_element/bluetooth_list_element.dart';
import 'package:glove_control/variables/global_variables.dart';
import 'package:easy_localization/easy_localization.dart';


class Bluetooth extends StatefulWidget {
  @override
  _BluetoothState createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {

  List allBluetoothDevices = [
    'Jonas B. Melås Beats Solo2',
    'Jonas B. Melås Beats Solo3',
  ];

  void connectBluetoothDevice(String key) {
    setState(() {
      devicesConnectingCount++;
      bluetoothDevices[key]['isConnecting'] = true;
    });
    Timer(Duration(seconds: 3), () {
      setState(() {
        bluetoothDevices[key]['isConnecting'] = false;
        devicesConnectingCount--;
        bluetoothDevices[key]['isConnected'] = true;
        devicesConnectedCount++;
        print('Bt device connected');
      });
    });
  }

  void disconnectBluetoothDevice(String key) {
    setState(() {
      bluetoothDevices[key]['isConnecting'] = true;
      devicesConnectingCount++;
    });
    Timer(Duration(seconds: 1), () {
      setState(() {
        bluetoothDevices[key]['isConnecting'] = false;
        devicesConnectingCount--;
        bluetoothDevices[key]['isConnected'] = false;
        devicesConnectedCount--;
        print('Bt device disconnected');
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 0, 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'myDevicesLabel'.tr(),
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
              for(var key in bluetoothDevices.keys)
                if (bluetoothDevices[key]['myDevice'])
                  BtListElement(
                    bdAddr: key,
                    title: bluetoothDevices[key]['title'],
                    description: bluetoothDevices[key]['description'],
                    myDeviceState: bluetoothDevices[key]['myDevice'],
                    isConnecting: bluetoothDevices[key]['isConnecting'],
                    isConnected: bluetoothDevices[key]['isConnected'],
                    iconImage: bluetoothDevices[key]['iconImage'],
                    onConnectingStateChange: (bool isConnected) =>
                    isConnected ? disconnectBluetoothDevice(key) : connectBluetoothDevice(key),
                    onOtherDeviceChange: () =>
                        setState(() =>
                        bluetoothDevices[key]['myDevice'] = true),
                    onMyDeviceStateChange: () =>
                        setState(() =>
                        bluetoothDevices[key]['myDevice'] = false),
                  ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 80, 0, 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'otherDevicesLabel'.tr(),
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
                for(var key in bluetoothDevices.keys)
                  if (!bluetoothDevices[key]['myDevice'])
                    BtListElement(
                      bdAddr: key,
                      title: bluetoothDevices[key]['title'],
                      description: bluetoothDevices[key]['description'],
                      myDeviceState: bluetoothDevices[key]['myDevice'],
                      isConnecting: bluetoothDevices[key]['isConnecting'],
                      isConnected: bluetoothDevices[key]['isConnected'],
                      iconImage: bluetoothDevices[key]['iconImage'],
                      onConnectingStateChange: (bool isConnected) =>
                      isConnected ? disconnectBluetoothDevice(key) : connectBluetoothDevice(key),
                      onOtherDeviceChange: () =>
                          setState(() =>
                          bluetoothDevices[key]['myDevice'] = true),
                      onMyDeviceStateChange: () =>
                          setState(() =>
                          bluetoothDevices[key]['myDevice'] = false),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
