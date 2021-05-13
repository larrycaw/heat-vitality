library led_controller.globals;
import 'package:heat_vitality/classes/glove.dart';
import 'package:heat_vitality/classes/shared_preference.dart';


// _____________Constants_____________
// Paths
final String translationPath = 'assets/translation';
final String flagPath = 'assets/flags/';
final String logoPath = 'assets/logo/';
//final String bluetoothIconPath = 'assets/bluetooth_device_icon/';

// Translation
final Map language = {
  'English':    {'flagPath': 'en.png', 'languageCode': 'en', 'countryCode': 'GB'},
  'Norsk':      {'flagPath': 'no.png', 'languageCode': 'no', 'countryCode': 'NO'},
  'Sámegilli':  {'flagPath': 'smi.png', 'languageCode': 'smi', 'countryCode': 'NO'},
};
// Default language / fallbackLocale
final String defaultLanguageCode = language['Norsk']['languageCode'];
final String defaultCountryCode = language['Norsk']['countryCode'];

// Link to at ease
final String urlAtEase = 'https://atease.no/';
final String atEaseLogo = 'atEaseLogo.png';

// Glove heat steps
final int lowHeat = 30;
final int mediumHeat = 70;
final int highHeat = 100;



// _____________Variables_____________
// Shared preference
SharedPreference sharedPreference = new SharedPreference();

// Gloves
List<Glove> gloves = [];

// Dark mode
bool darkModeOn = false;