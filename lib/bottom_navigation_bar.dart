import 'package:flutter/material.dart';
import 'package:heat_vitality/pages/bluetooth.dart';
import 'package:heat_vitality/pages/dashboard.dart';
import 'package:heat_vitality/pages/settings.dart';
import 'package:heat_vitality/variables/global_variables.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

// Main¿?
class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  static const int bluetooth = 0;
  static const int dashboard = 1;
  static const int settings = 2;

  Widget getBody() {
    switch (_currentIndex) {
      case dashboard:
        return Dashboard();
      case settings:
        return Settings(
          newLanguage: (String newLanguage) => setLanguage(newLanguage),
        );
      default:
        return Bluetooth();
    }
  }

  void setLanguage(String newLanguage) {
    switch (newLanguage) {
      case 'English':
        context.locale = Locale('en', 'GB');
        break;
      case 'Norsk':
        context.locale = Locale('no', 'NO');
        break;
      case 'Sámi':
        //context.locale = Locale('smi', 'NO');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Prevent landscape portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'appTitle'.tr(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0XFF67d0c6),
        elevation: 0,
      ),
      body: SafeArea(
        child: getBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        iconSize: 50,
        selectedFontSize: 20,
        backgroundColor: Colors.grey[300],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bluetooth,
              color:
                  _currentIndex == bluetooth ? Colors.blue[900] : Colors.black,
            ),
            label: 'bluetoothNavTitle'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.speed, //device_thermostat?
              color:
                  _currentIndex == dashboard ? Colors.red[600] : Colors.black,
            ),
            label: 'dashboardNavTitle'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color:
                  _currentIndex == settings ? Colors.grey[700] : Colors.black,
            ),
            label: 'settingsNavTitle'.tr(),
          ),
        ],
        onTap: (index) {
          setState(() {
            print('index: $index');
            print('Bt devices connected count: $devicesConnectedCount');
            if (devicesConnectingCount == 0) {
              _currentIndex = index;
            }
          });
        },
      ),
    );
  }
}
