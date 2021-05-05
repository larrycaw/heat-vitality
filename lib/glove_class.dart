class Glove {
  String deviceName;
  String batteryPercentage;
  int gloveHeat;

  Glove(String deviceName, String batteryPercentage, int gloveHeat) {
    deviceName = this.deviceName;
    batteryPercentage = this.batteryPercentage;
    gloveHeat = this.gloveHeat;
  }

  String get getDeviceName => this.deviceName;

  set setDeviceName(String deviceName) => this.deviceName = deviceName;

  get getBatteryPercentage => this.batteryPercentage;

  set setBatteryPercentage(batteryPercentage) =>
      this.batteryPercentage = batteryPercentage;

  get getGloveHeat => this.gloveHeat;

  set setGloveHeat(gloveHeat) => this.gloveHeat = gloveHeat;
}
