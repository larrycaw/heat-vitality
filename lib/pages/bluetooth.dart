import 'dart:async';

import 'package:flutter/material.dart';
import 'package:glove_control/widget_element/app_bar.dart';
import 'package:glove_control/widget_element/bluetooth_list_element.dart';
import 'package:glove_control/variables/global_variables.dart';
import 'package:easy_localization/easy_localization.dart';


class Bluetooth extends StatefulWidget {
  @override
  _BluetoothState createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {

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

  void addMyDevice(String key) {
    bluetoothDevices[key]['myDevice'] = true;
    print('Device added');
  }

  void forgetMyDevice(String key) {
    bluetoothDevices[key]['myDevice'] = false;
    print('Device forgotten');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    onForgetDevice: () =>
                        setState(() => forgetMyDevice(key)),
                    onUpdateBluetoothDevice: () =>
                        setState(() => print('Updated bt device')),
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
                      onAddDevice: () =>
                          setState(() => addMyDevice(key)),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
