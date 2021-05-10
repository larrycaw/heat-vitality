import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heat_vitality/pages/about_bluetooth_device.dart';
import 'package:heat_vitality/pages/change_bluetooth_info.dart';
import 'bottom_navigation_bar.dart';
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
            "/old_index": (context) => BottomNavigation(),
            "/bluetooth": (context) => Bluetooth(),
            "/about_bluetooth_device": (context) => AboutBluetoothDevice(),
            "/change_bluetooth_info": (context) => ChangeBluetoothInfo(),
            "/settings": (context) => Settings(),
            "/": (context) => Dashboard(),
            "/glove_settings": (context) => GloveSettings(),
            "/splash": (context) => SplashScreen()
          },
        ),
      ),
    );