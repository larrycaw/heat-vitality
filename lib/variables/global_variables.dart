library led_controller.globals;


// _____________Constants_____________
// Bluetooth
//final String bluetoothIconPath = 'assets/bluetooth_device_icon/';

// Translation
final Map language = {
  'English':  {'flagPath': 'en.png', 'languageCode': 'en', 'countryCode': 'GB'},
  'Norsk':    {'flagPath': 'no.png', 'languageCode': 'no', 'countryCode': 'NO'},
  'Sámi':     {'flagPath': 'smi.png', 'languageCode': 'smi', 'countryCode': 'NO'},
};
final String translationPath = 'assets/translation';
// Default language / fallbackLocale
final String defaultLanguageCode = language['Norsk']['languageCode'];
final String defaultCountryCode = language['Norsk']['countryCode'];



// _____________Variables_____________
// Bluetooth
Map bluetoothDevices = {
  '01:22:33:44:55:66': {'title': '1', 'description': '1', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '02:22:33:44:55:66': {'title': '2', 'description': '2', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '03:22:33:44:55:66': {'title': '3', 'description': '3', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '04:22:33:44:55:66': {'title': '4', 'description': '4', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '05:22:33:44:55:66': {'title': '5', 'description': '5', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '06:22:33:44:55:66': {'title': '6', 'description': '6', 'myDevice': false, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
  '07:22:33:44:55:66': {'title': '7', 'description': '7', 'myDevice': true, 'isConnecting': false, 'isConnected': false, 'iconImage': 'bt.jpg'},
};
// Count
int devicesConnectedCount = 0;
int devicesConnectingCount = 0;

// Dark mode
bool darkModeOn = false;