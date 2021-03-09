library led_controller.globals;

import 'package:flutter/material.dart';

// Constants
final Map language = {
  'English':  {'flagPath': 'en.png', 'index': 0},
  'Norsk':    {'flagPath': 'no.png', 'index': 1},
};

final bluetoothIconPath = "assets/bluetooth_device_icon/";



// Variables
Map ledLights = {
  'redBtn':     {'ledOn?': false, 'ledColor': Colors.red},
  'yellowBtn':  {'ledOn?': false, 'ledColor': Colors.yellow},
  'greenBtn':   {'ledOn?': false, 'ledColor': Colors.green},
  'blueBtn':    {'ledOn?': false, 'ledColor': Colors.blue},
  'whiteBtn':   {'ledOn?': false, 'ledColor': Colors.white},
};

Map bluetoothDevices = {
  '01:22:33:44:55:66': {'title': '1', 'description': '1', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '02:22:33:44:55:66': {'title': '2', 'description': '2', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '03:22:33:44:55:66': {'title': '3', 'description': '3', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '04:22:33:44:55:66': {'title': '4', 'description': '4', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '05:22:33:44:55:66': {'title': '5', 'description': '5', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '06:22:33:44:55:66': {'title': '6', 'description': '6', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '07:22:33:44:55:66': {'title': '7', 'description': '7', 'myDevice': true, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
};

int devicesConnectedCount = 0;
int devicesConnectingCount = 0;
bool darkModeOn = false;