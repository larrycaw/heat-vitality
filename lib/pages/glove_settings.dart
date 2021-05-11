import 'package:flutter/material.dart';
//import 'package:heat_vitality/classes/glove.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:easy_localization/easy_localization.dart';

//enum heatSteps {low, medium, high}

class GloveSettings extends StatefulWidget {
  @override
  _GloveSettingsState createState() => _GloveSettingsState();
}

// kilder:
// https://flutter.dev/docs/cookbook/design/tabs
class _GloveSettingsState extends State<GloveSettings> {
  final double minDegree = 0;
  final double maxDegree = 100;
  final double thermostatWidth = 33;
  int selectedRadioTile;
  int selectedRadio;

  List<String> options = ["tempLow".tr(), "tempMedium".tr(), "tempHigh".tr()];

  double _degreeValue = 100;
  int batteryPercentage = 100;
  int batteryIconPercentage = 100;
  Color batteryIconColor = Colors.green;

  void onDegreeChanged(double newValue) {
    setState(() {
      _degreeValue = newValue;
      batteryPercentage = newValue.ceil();
      batteryIconPercentage = newValue.toInt() < 15 ? 15 : newValue.toInt();
      if (batteryPercentage > 62) {
        batteryIconColor = Colors.green;
      } else if (batteryPercentage > 35) {
        batteryIconColor = Colors.amber[600];
      } else {
        batteryIconColor = Colors.red;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                  backgroundColor: Color(0xFF6223EE),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "tabStandards".tr()),
                      Tab(text: "tabCustom".tr())
                    ],
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context), //denne må rettes
                  )),

              //Tab-innhold
              body: TabBarView(
                children: [
                  //Text("Trinnmeny"), //add radio-menu here

                  Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                "stepChoice".tr(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      RadioListTile(
                        value: 1,
                        groupValue: selectedRadioTile,
                        title: Text(options[0]),
                        onChanged: (val) {
                          print("Pressed radio: " + options[0]);
                          setSelectedRadioTile(val);
                        },
                        activeColor: Color(0xFF6223EE),
                        selected: false,
                      ),
                      RadioListTile(
                        value: 2,
                        groupValue: selectedRadioTile,
                        title: Text(options[1]),
                        onChanged: (val) {
                          print("Pressed radio: " + options[1]);
                          setSelectedRadioTile(val);
                        },
                        activeColor: Color(0xFF6223EE),
                        selected: false,
                      ),
                      RadioListTile(
                        value: 3,
                        groupValue: selectedRadioTile,
                        title: Text(options[2]),
                        onChanged: (val) {
                          print("Pressed radio: " + options[2]);
                          setSelectedRadioTile(val);
                        },
                        activeColor: Color(0xFF6223EE),
                        selected: false,
                      )
                    ],
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                "customize".tr(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: minDegree,
                            maximum: maxDegree,
                            showLabels: false,
                            showTicks: false,
                            radiusFactor: 0.8,
                            axisLineStyle: AxisLineStyle(
                              cornerStyle: CornerStyle.bothCurve,
                              gradient: const SweepGradient(
                                colors: <Color>[
                                  Colors.blue,
                                  Colors.yellow,
                                  Colors.red,
                                ],
                                stops: <double>[0.15, 0.5, 0.85],
                              ),
                              thickness: thermostatWidth,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                value: _degreeValue,
                                cornerStyle: CornerStyle.bothCurve,
                                width: thermostatWidth,
                                sizeUnit: GaugeSizeUnit.logicalPixel,
                                color: Colors.transparent,
                              ),
                              MarkerPointer(
                                value: _degreeValue,
                                enableDragging: true,
                                onValueChanged: onDegreeChanged,
                                markerHeight: 40,
                                markerWidth: 40,
                                markerType: MarkerType.circle,
                                color: Colors.white,
                                borderWidth: 2,
                                borderColor: Colors.black,
                              ),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                angle: 90,
                                axisValue: 5,
                                positionFactor: 0.1,
                                widget: Text(
                                  _degreeValue.ceil().toString() + '%',
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            )));
  }
}
