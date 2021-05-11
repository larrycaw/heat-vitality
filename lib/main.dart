import 'package:flutter/material.dart';
import 'package:heat_vitality/pages/about_bluetooth_device.dart';
import 'package:heat_vitality/pages/change_bluetooth_name.dart';
import 'package:heat_vitality/pages/change_bluetooth_description.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heat_vitality/variables/global_variables.dart';
import 'package:heat_vitality/pages/bluetooth.dart';
import 'package:heat_vitality/pages/settings.dart';
import 'package:heat_vitality/pages/dashboard.dart';
import "package:heat_vitality/pages/glove_settings.dart";
import 'package:heat_vitality/splash.dart';

void main() => runApp(
      EasyLocalization(
        supportedLocales: [
          Locale('en', 'GB'),
          Locale('no', 'NO'),
        ],
        path: translationPath,
        fallbackLocale: Locale(defaultLanguageCode, defaultCountryCode),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/splash",
          routes: {
            "/splash": (context) => SplashScreen(),
            "/": (context) => Dashboard(),
            "/bluetooth": (context) => Bluetooth(),
            "/about_bluetooth_device": (context) => AboutBluetoothDevice(),
            "/change_bluetooth_name": (context) => ChangeBluetoothName(),
            "/change_bluetooth_description": (context) => ChangeBluetoothDescription(),
            "/glove_settings": (context) => GloveSettings(),
            "/settings": (context) => Settings(),
          },
        ),
      ),
    );