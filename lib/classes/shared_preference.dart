import 'package:shared_preferences/shared_preferences.dart';
import 'glove.dart';

class SharedPreference {
  String gloveKeyListKey;
  List<Glove> gloves;

  SharedPreference() {
    this.gloveKeyListKey = "gloveKeyListKey";
    this.gloves = [];
  }

  get getGloveKeyListKey => gloveKeyListKey;
  get getGloves => gloves;



  // Read glove keys
  Future<List<String>> readGloveKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> gloveKeys = prefs.getStringList(gloveKeyListKey) ?? [];

    return gloveKeys;
  }

  // Read saved gloves from shared preference, (return [] if no data)
  void readGloves() async {
    List<String> gloveKeys = await readGloveKeys();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (String gloveKey in gloveKeys) {
      List<String> gloveList = prefs.getStringList(gloveKey) ?? [];
      print("Glove list: $gloveList");

      if (gloveList != []) {
        gloves.add(new Glove(
          key: gloveList[0],
          name: gloveList[1],
          desc: gloveList[2],
          battery: gloveList[3] as int,
          heatStep: gloveList[4] as int,
          heatCustom: gloveList[5] as double,
          myDevice: true,
          isConnecting: false,
          isConnected: gloveList[6] as bool,
        ),);
      }
      else gloves = [];
    }
  }



  // Save/update glove keys, (that are registered as myDevice)
  void saveGloveKeys() async {
    List<String> gloveKeys = [];

    for (Glove glove in gloves) {
      if (glove.getMyDeviceState) {
        gloveKeys.add(glove.getKey);
      }
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(gloveKeyListKey, gloveKeys);
    print('GloveKeys saved $gloveKeys');
  }

  // Save/update glove, (myDevice and isConnecting have default values=
  void saveGlove(Glove glove) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String key = glove.getKey;
    String name = glove.getName;
    String desc = glove.getDesc;
    String battery = glove.getBattery;
    String heatStep = glove.getHeatStep;
    String heatCustom = glove.getHeatCustom;
    String isConnected = glove.getIsConnected;

    List<String> value = [key, name, desc, battery, heatStep, heatCustom, isConnected];
    prefs.setStringList(key, value);
    print('Glove saved $value');
  }



  // Remove glove from shared preference
  void removeGlove(Glove glove) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(glove.getKey);

    // Update keys
    saveGloveKeys();
  }
}
