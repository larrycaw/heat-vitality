import 'package:flutter/material.dart';
import 'package:heat_vitality/classes/glove.dart';
import 'package:heat_vitality/variables/global_variables.dart';
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
  List<String> options = [
    "tempOff".tr(),
    "tempLow".tr(),
    "tempMedium".tr(),
    "tempHigh".tr()
  ];

  @override
  Widget build(BuildContext context) {
    // Get parameter sent (when asking to open this page)
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    Glove glove;

    if (arguments != null) {
      glove = arguments['glove'];
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                      RadioListTile(
                        value: 0,
                        groupValue: glove.getHeatStep,
                        title: Text(options[0]),
                        onChanged: (val) {
                          glove.setHeatStep = val;
                          sharedPreference.saveGlove(glove);
                          print("Pressed radio: " + options[0]);
                          setState(() {});
                        },
                        activeColor: Color(0xFF6223EE),
                        selected: false,
                      ),
                      RadioListTile(
                        value: lowHeat,
                        groupValue: glove.getHeatStep,
                        title: Text(options[1]),
                        onChanged: (val) {
                          glove.setHeatStep = val;
                          sharedPreference.saveGlove(glove);
                          print("Pressed radio: " + options[1]);
                          setState(() {});
                        },
                        activeColor: Color(0xFF6223EE),
                        selected: false,
                      ),
                      RadioListTile(
                        value: mediumHeat,
                        groupValue: glove.getHeatStep,
                        title: Text(options[2]),
                        onChanged: (val) {
                          glove.setHeatStep = val;
                          sharedPreference.saveGlove(glove);
                          print("Pressed radio: " + options[2]);
                          setState(() {});
                        },
                        activeColor: Color(0xFF6223EE),
                        selected: false,
                      ),
                      RadioListTile(
                        value: highHeat,
                        groupValue: glove.getHeatStep,
                        title: Text(options[3]),
                        onChanged: (val) {
                          glove.setHeatStep = val;
                          sharedPreference.saveGlove(glove);
                          print("Pressed radio: " + options[3]);
                          setState(() {});
                        },
                        activeColor: Color(0xFF6223EE),
                        selected: false,
                      ),
                    ],
                  ),

                  Center(
                      child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
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
                          thickness: 33,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: glove.getHeatCustom,
                            cornerStyle: CornerStyle.bothCurve,
                            width: 33,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            color: Colors.transparent,
                          ),
                          MarkerPointer(
                            value: glove.getHeatCustom,
                            enableDragging: true,
                            onValueChanged: (val) {
                              if (val < 0.5)
                                glove.setHeatCustom = 0;
                              else
                                glove.setHeatCustom = val;
                              setState(() {});
                            },
                            onValueChangeEnd: (val) {
                              sharedPreference.saveGlove(glove);
                            },
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
                              glove.getHeatCustom.ceil().toString() + '%',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            )));
  }
}
