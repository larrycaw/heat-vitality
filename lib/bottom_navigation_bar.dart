import 'package:flutter/material.dart';
/*import 'package:glove_control/pages/bluetooth.dart';
import 'package:glove_control/pages/settings.dart';*/
import 'package:glove_control/variables/global_variables.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart' ;

// Main¿?
class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  Widget getBody() {
    switch (_currentIndex) {
      case 1:
        return Text('1');
        //return Controls();  // controls..
      case 2:
        return Text('2');
        //return Settings(newLanguage: (String newLanguage) => setLanguage(newLanguage),);
      default:
        return Text('3');
        //return Bluetooth();
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
    }
  }

  @override
  Widget build(BuildContext context) {

    // Prevent landscape portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'appTitle'.tr(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
        ),
      ),
      body: SafeArea(
        child: getBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        iconSize: 50,
        selectedFontSize: 20,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bluetooth,
              color: _currentIndex == 0 ? Colors.blue[900] : Colors.black,
            ),
            label: 'bluetoothNavTitle'.tr(),
            backgroundColor: Colors.blue[200],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wb_incandescent,
              color: _currentIndex == 1 ? Colors.yellow : Colors.black,
            ),
            label: 'dashboardNavTitle'.tr(),
            backgroundColor: Colors.blue[200],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _currentIndex == 2 ? Colors.grey[600] : Colors.black,
            ),
            label: 'settingsNavTitle'.tr(),
            backgroundColor: Colors.blue[200],
          ),
        ],
        onTap: (index){
          setState(() {
            print('index: $index');
            print('Bt devices connected count: $devicesConnectedCount');
            if(devicesConnectingCount == 0) {
              _currentIndex = index;
            }
          });
        },
      ),
    );
  }
}
