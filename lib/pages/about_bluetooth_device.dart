import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heat_vitality/widget_element/advertisement_at_ease.dart';
import 'package:heat_vitality/classes/glove.dart';

class AboutBluetoothDevice extends StatefulWidget {
  @override
  _AboutBluetoothDeviceState createState() => _AboutBluetoothDeviceState();
}

class _AboutBluetoothDeviceState extends State<AboutBluetoothDevice> {
  void forgetBluetoothDevice() {
    Navigator.pop(context, {
      'forgetDevice': true,
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get parameter sent (when asking to open this page)
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    Glove glove;

    if (arguments != null) {
      glove = arguments['glove'];
      print('Glove received: $glove');
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          backgroundColor: Color(0XFF571fe4),
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 0, 5),
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
                  bottom: BorderSide(color: Colors.grey[300]),
                ),
              ),
              height: 84,
              child: TextButton(
                onPressed: () async {
                  print('"Change bt device name"-button pressed');
                  await Navigator.pushNamed(
                    context,
                    "/change_bluetooth_name",
                    arguments: <String, Glove>{
                      'glove': glove,
                    },
                  );

                  setState(() {
                    print('Back from change_bluetooth_name.dart');
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  onSurface: Colors.grey,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'name'.tr(),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            glove.getName,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 22,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]),
                ),
              ),
              height: 84,
              child: TextButton(
                onPressed: () async {
                  print('"Change bt device description"-button pressed');
                  await Navigator.pushNamed(
                    context,
                    "/change_bluetooth_description",
                    arguments: <String, Glove>{
                      'glove': glove,
                    },
                  );

                  setState(() {
                    print('Back from change_bluetooth_description.dart');
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  onSurface: Colors.grey,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
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
                            glove.getDesc,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 22,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),

            // Forget bt device button
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[300]),
                  bottom: BorderSide(color: Colors.grey[300]),
                ),
              ),
              height: 60,
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
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'forgetDevice'.tr(),
                      style: TextStyle(fontSize: 17, color: Colors.red[700]),
                    ),
                  ],
                ),
              ),
            ),
            AdvertisementAtEase(),
          ],
        ));
  }
}
