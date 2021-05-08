class Glove {
  String name;
  String desc;
  int battery;
  int heatStep;
  int heatCustom;

  Glove({this.name, this.desc, this.battery, this.heatStep, this.heatCustom});

  static List<Glove> getGloves() {
    return <Glove>[
      Glove(
          name: "Isak",
          desc: "Varmehanske fra At Ease",
          battery: 100,
          heatStep: 0,
          heatCustom: 0),
      Glove(
          name: "Adrian",
          desc: "Varmehanske fra At Ease",
          battery: 40,
          heatStep: 0,
          heatCustom: 0)
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
}
