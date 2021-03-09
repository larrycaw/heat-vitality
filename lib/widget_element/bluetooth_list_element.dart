import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BtListElement extends StatelessWidget {

  final String bdAddr;
  final bool myDeviceState;
  final bool isConnected;
  final Function(bool) onConnectingStateChange;
  final VoidCallback onOtherDeviceChange;
  final VoidCallback onMyDeviceStateChange;
  final String title;
  final String description;
  final bool isConnecting;
  final String iconImage;

  BtListElement({
    @required this.bdAddr,
    @required this.myDeviceState,
    @required this.isConnected,
    @required this.onConnectingStateChange,
    @required this.onOtherDeviceChange,
    @required this.onMyDeviceStateChange,
    this.title = 'Bluetooth device',
    this.description = 'Unknown',
    this.isConnecting = false,
    this.iconImage = 'bt.jpg',
  });


  bool getIsConnected() {
    return this.isConnected;
  }

  bool getMyDeviceState() {
    return this.myDeviceState;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black),
          ),
      ),
      child: TextButton(
        onPressed: () {
          print('Bt element tapped');
          onConnectingStateChange(getIsConnected());
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          onSurface: Colors.grey,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 12,),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 12,),
                      Text(
                        description,
                        style: TextStyle(
                            color: Colors.grey[700]
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isConnecting ?
                SpinKitRing(//SpinKitPumpingHeart / SpinKitFadingCube
                  color: Color(0XFF67d0c6),
                  size: 25.0,
                ) :
                Text(
                  getIsConnected() ? 'connected'.tr() : 'notConnected'.tr(),
                  style: TextStyle(
                      color: Colors.grey[700]
                  ),
                ),
                SizedBox(width: 10,)
              ],
            ),
            GestureDetector(
                onTap: () async {
                  print('Icon tapped');
                  if (getMyDeviceState()) {
                    dynamic result = await Navigator.pushNamed(
                      context,
                      "/about_bluetooth_device",
                      arguments: <String, String>{'bdAddr': bdAddr},
                    );
                    if(result != null) {
                      // switch
                      if (result['forgetDevice']) onMyDeviceStateChange();
                      else print(result['title']);
                    }
                  } else if (!getMyDeviceState()) onOtherDeviceChange();
                },
                child: getMyDeviceState() ? Icon(Icons.arrow_forward_ios, size: 25,) : Icon(Icons.add, size: 30,)
            ),
          ],
        ),
      ),
    );
  }
}
