import 'package:flutter/material.dart';
import 'package:glove_control/pages/about_bluetooth_device.dart';
import 'bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:glove_control/variables/global_variables.dart';
import 'package:glove_control/pages/bluetooth.dart';
import 'package:glove_control/pages/settings.dart';

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
        "/old_index": (context) => BottomNavigation(),
        "/": (context) => Bluetooth(),
        "/about_bluetooth_device": (context) => AboutBluetoothDevice(),
        "/settings": (context) => Settings(),
      },
    ),
  ),
);
