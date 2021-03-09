import 'package:flutter/material.dart';
import 'package:glove_control/pages/about_bluetooth_device.dart';
import 'bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';

void main() => runApp(
  EasyLocalization(
    supportedLocales: [
      Locale('en', 'GB'),
      Locale('no', 'NO'),
    ],
    path: 'assets/translation',
    fallbackLocale: Locale('no', 'NO'),
    child: MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => BottomNavigation(),
        "/about_bluetooth_device": (context) => AboutBluetoothDevice(),
      },
    ),
  ),
);
