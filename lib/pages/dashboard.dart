import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math' as math;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double _degreeValue = 36;
  final double minDegree = 10;
  final double maxDegree = 50;
  final double thermostatWidth = 33;

  void onDegreeChanged(double newValue) {
    setState(() {
      _degreeValue = newValue;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.battery_full,
              size: 80,
              color: Colors.green,
            ),
            Text(
              '90%',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Transform.rotate(
              angle: 90 * math.pi / 180,
              child: Icon(
                Icons.battery_full_outlined,
                size: 200,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18, 60, 0, 0),
              child: Container(
                width: 147,
                height: 80,
                child: Center(
                  child: Text(
                    '90%',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
