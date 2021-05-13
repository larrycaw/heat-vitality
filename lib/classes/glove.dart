import 'package:heat_vitality/variables/global_variables.dart';

class Glove {
  String key;
  String name;
  String desc;
  int battery;
  int heatStep;
  double heatCustom;
  bool myDevice;
  bool isConnecting;
  bool isConnected;

  Glove({
    this.key,
    this.name,
    this.desc,
    this.battery,
    this.heatStep,
    this.heatCustom,
    this.myDevice,
    this.isConnecting,
    this.isConnected,
  });

  static List<Glove> getGloves() {
    return <Glove>[
      Glove(
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
      Glove(
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
      Glove(
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

  get getKey => this.key;

  get getName => name;
  set setName(String name) => this.name = name;

  get getDesc => this.desc;
  set setDesc(String desc) => this.desc = desc;

  get getBattery => battery;
  set setBattery(battery) => this.battery = battery;

  get getHeatStep => this.heatStep;
  set setHeatStep(int heatStep) {
    this.heatStep = heatStep;
    this.heatCustom = heatStep.toDouble();
  }

  get getHeatCustom => this.heatCustom;
  set setHeatCustom(double heatCustom) {
    this.heatCustom = heatCustom;
    if (heatCustom == 0) this.heatStep = 0;
    else if (heatCustom <= 40) this.heatStep = lowHeat;
    else if (heatCustom <= 80) this.heatStep = mediumHeat;
    else if (heatCustom <= 100) this.heatStep = highHeat;
  }

  get getMyDeviceState => this.myDevice;
  void addDeviceToMyDevices() => this.myDevice = true;
  void removeDeviceFromMyDevices() => this.myDevice = false;

  get getIsConnecting => this.isConnecting;

  void startConnecting() {
    this.isConnecting = true;
  }

  void stopConnecting() {
    this.isConnecting = false;
  }

  get getIsConnected => this.isConnected;

  void connect() {
    this.isConnected = true;
  }

  void disconnect() {
    this.isConnected = false;
  }
}
