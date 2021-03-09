import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:glove_control/variables/global_variables.dart';

/*class AboutBluetoothDevice extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        iconTheme: IconThemeData(
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
        backgroundColor: Colors.blue[200],
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
        ),
      ),
      body: Text('About'),
    );
  }
}*/

class AboutBluetoothDevice extends StatefulWidget {
  @override
  _AboutBluetoothDeviceState createState() => _AboutBluetoothDeviceState();
}

class _AboutBluetoothDeviceState extends State<AboutBluetoothDevice> {

  void updateBluetoothDevice() {
    // Navigate to bluetooth-screen
    Navigator.pop(context, {
      'forgetDevice': false,
      'title': 'ttl',
      'description': 'desc',
    });
    print('');
    print('Back-button pressed');
  }

  void forgetBluetoothDevice() {
    // Navigate to bluetooth-screen
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
        backgroundColor: Colors.blue,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => updateBluetoothDevice(), //Navigator.of(context).pop(),
          ),
          title: Text(
            'appTitle'.tr(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
          ),
        ),


        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 40, 0, 5),
              child: Row(
                children: [
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  print('"Change bt device title"-button pressed');
                  setState(() {
                    bluetoothDevices[bdAddr]['title'] = '"New title"';
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                  onSurface: Colors.grey,
                ),
                child: Row(
                  children: [
                    Text(
                      'Title',
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
              margin: EdgeInsets.only(bottom: 4),
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  print('"Change bt device description"-button pressed');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                  onSurface: Colors.grey,
                ),
                child: Row(
                  children: [
                    Text(
                      'Description',
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
              margin: EdgeInsets.only(bottom: 4),
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  forgetBluetoothDevice();
                  print('Forget bt device');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                  onSurface: Colors.grey,
                ),
                child: Row(
                  children: [
                    Text(
                      'Forget this device',
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
