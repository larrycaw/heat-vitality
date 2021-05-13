import 'package:shared_preferences/shared_preferences.dart';
import 'glove.dart';

class SharedPreference {
  String gloveKeyListKey;
  static List<String> gloveKeys = [];
  static List<Glove> gloves = [];

  SharedPreference() {
    this.gloveKeyListKey = "gloveKeyListKey";
    readGloveKeys();
    readGloves();
  }

  get getGloveKeyListKey => gloveKeyListKey;
  get getGloves => gloves;



  // Read glove keys
  void readGloveKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gloveKeys = prefs.getStringList(gloveKeyListKey) ?? [];
    print("Glove keys read: $gloveKeys");
  }

  // Read saved gloves from shared preference, (return [] if no data)
  void readGloves() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if ("$gloveKeys" != "[]") {
      for (String gloveKey in gloveKeys) {
        List<String> gloveList = prefs.getStringList(gloveKey) ?? [];

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
      }
    }
    else if ("$gloveKeys" == "[]") {
      //gloves = [];

      //Test data
      print('Get test data');
      gloves = [
        new Glove(
          key: "111",
          name: "Isak",
          desc: "Varmehanske fra At Ease",
          battery: 100,
          heatStep: 0,
          heatCustom: 0,
          myDevice: false,
          isConnecting: false,
          isConnected: false,
        ),
        new Glove(
          key: "222",
          name: "Adrian",
          desc: "Varmehanske fra At Ease",
          battery: 40,
          heatStep: 0,
          heatCustom: 0,
          myDevice: false,
          isConnecting: false,
          isConnected: false,
        ),
        new Glove(
          key: "333",
          name: "Markus Solheim",
          desc: "Varmehanske fra At Ease",
          battery: 69,
          heatStep: 0,
          heatCustom: 0,
          myDevice: false,
          isConnecting: false,
          isConnected: false,
        ),
      ];
    }
  }



  // Save/update glove keys, (that are registered as myDevice)
  void saveGloveKeys() async {
    gloveKeys = [];

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
