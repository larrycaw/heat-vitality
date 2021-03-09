import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:glove_control/variables/global_variables.dart';

class AboutBluetoothDevice extends StatefulWidget {
  @override
  _AboutBluetoothDeviceState createState() => _AboutBluetoothDeviceState();
}

class _AboutBluetoothDeviceState extends State<AboutBluetoothDevice> {

  void forgetBluetoothDevice() {
    print('Context $context');
    Navigator.pop(context, {
      'forgetDevice': true,
    });
  }


  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String bdAddr;

    if (arguments != null) {
      bdAddr = arguments['bdAddr'];
      print('bdAddr received: $bdAddr');
    }

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          title: Text(
            'appTitle'.tr(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0XFF67d0c6),
          elevation: 0,
        ),


        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 40, 0, 5),
              child: Row(
                children: [
                  Text(
                    'about'.tr(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              height: 50,
              child: TextButton(
                onPressed: () {
                  print('"Change bt device title"-button pressed');
                  setState(() {
                    bluetoothDevices[bdAddr]['title'] = '"New title"';
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  onSurface: Colors.grey,
                ),
                child: Row(
                  children: [
                    Text(
                      'title'.tr(),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            bdAddr != null ? bluetoothDevices[bdAddr]['title'] : "Could not get value",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Icon(Icons.arrow_forward_ios, size: 25,),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 0.5),
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              height: 50,
              child: TextButton(
                onPressed: () {
                  print('"Change bt device description"-button pressed');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  onSurface: Colors.grey,
                ),
                child: Row(
                  children: [
                    Text(
                      'description'.tr(),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            bdAddr != null ? bluetoothDevices[bdAddr]['description'] : "Could not get value",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Icon(Icons.arrow_forward_ios, size: 25,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 80,),

            // Forget bt dvice button
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              height: 50,
              child: TextButton(
                onPressed: () {
                  forgetBluetoothDevice();
                  print('Forget bt device');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  onSurface: Colors.grey,
                ),
                child: Row(
                  children: [
                    Text(
                      'forgetDevice'.tr(),
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.red[700]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
