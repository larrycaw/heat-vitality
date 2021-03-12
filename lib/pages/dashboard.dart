import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math' as math;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final double minDegree = 0;
  final double maxDegree = 100;
  final double thermostatWidth = 33;

  double _degreeValue = 100;
  int batteryPercentage = 100;
  int batteryIconPercentage = 100;
  Color batteryIconColor = Colors.green;

  void onDegreeChanged(double newValue) {
    setState(() {
      _degreeValue = newValue;
      batteryPercentage = newValue.ceil();
      batteryIconPercentage = newValue.toInt() < 15 ? 15 : newValue.toInt();
      if(batteryPercentage > 62) {
        batteryIconColor = Colors.green;
      } else if(batteryPercentage > 35) {
        batteryIconColor = Colors.amber[600];
      } else {
        batteryIconColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    _degreeValue.ceil().toString() + '°C',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight .bold,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Icon(
                        Icons.battery_full,
                        size: 80,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(28, 19, 0, 0),
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: new BorderRadius.all(
                              Radius.circular(2.0),
                            ),
                          ),
                          width: 24,
                          height: 50,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 98 - batteryIconPercentage,
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                flex: 0 + batteryIconPercentage,
                                child: Container(
                                  color: batteryIconColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Text(
                    '$batteryPercentage%',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
