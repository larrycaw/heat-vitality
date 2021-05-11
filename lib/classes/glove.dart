class Glove {
  String name;
  String desc;
  int battery;
  int heatStep;
  int heatCustom;
  bool myDevice;
  bool isConnecting;
  bool isConnected;
  static int devicesConnectedCount = 0;
  static int devicesConnectingCount = 0;

  Glove({this.name, this.desc, this.battery, this.heatStep, this.heatCustom, this.myDevice, this.isConnecting, this.isConnected});

  static List<Glove> getGloves() {
    return <Glove>[
      Glove(
        name: "Isak",
        desc: "Varmehanske fra At Ease",
        battery: 100,
        heatStep: 0,
        heatCustom: 0,
        myDevice: true,
        isConnecting: false,
        isConnected: false,
      ),
      Glove(
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

  get getDesc => this.desc;
  set setDesc(String desc) => this.desc = desc;

  get getName => name;
  set setName(String name) => this.name = name;

  get getBattery => battery;
  set setBattery(battery) => this.battery = battery;

  get getHeatStep => this.heatStep;
  set setHeatStep(int heatStep) => this.heatStep = heatStep;

  get getHeatCustom => this.heatCustom;
  set setHeatCustom(int heatCustom) => this.heatCustom = heatCustom;

  get getMyDeviceState => this.myDevice;
  void addDeviceToMyDevices() => this.myDevice = true;
  void removeDeviceFromMyDevices() => this.myDevice = false;


  get getIsConnecting => this.isConnecting;

  void startConnecting() {
    this.isConnecting = true;
    devicesConnectingCount++;
  }
  void stopConnecting() {
    this.isConnecting = false;
    devicesConnectingCount--;
  }


  get getIsConnected => this.isConnected;

  void connect() {
    this.isConnected = true;
    devicesConnectedCount++;
  }

  void disconnect() {
    this.isConnected = false;
    devicesConnectedCount--;
  }
}
