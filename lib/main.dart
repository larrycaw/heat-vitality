import 'package:flutter/material.dart';
import 'package:glove_control/pages/about_bluetooth_device.dart';
import 'bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:glove_control/variables/global_variables.dart';
import 'package:glove_control/pages/bluetooth.dart';

void main() => runApp(
  EasyLocalization(
    supportedLocales: [
      Locale('en', 'GB'),
      Locale('no', 'NO'),
    ],
    path: translationPath,
    fallbackLocale: Locale(defaultLanguageCode, defaultCountryCode),
    child: MaterialApp(
      initialRoute: "/",
      routes: {
        "/gammelIndex": (context) => BottomNavigation(),
        "/about_bluetooth_device": (context) => AboutBluetoothDevice(),
        "/": (context) => Bluetooth(),
      },
    ),
  ),
);
