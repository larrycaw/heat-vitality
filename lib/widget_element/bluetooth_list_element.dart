import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BtListElement extends StatelessWidget {

  final String bdAddr;
  final bool myDevice;
  final bool isConnected;
  final Function(bool) onConnectingStateChange;
  final VoidCallback onOtherDeviceChange;
  final VoidCallback onMyDeviceChange;
  final String title;
  final String description;
  final bool isConnecting;
  final String iconImage;

  BtListElement({
    @required this.bdAddr,
    @required this.myDevice,
    @required this.isConnected,
    @required this.onConnectingStateChange,
    @required this.onOtherDeviceChange,
    @required this.onMyDeviceChange,
    this.title = 'Bluetooth device',
    this.description = 'Unknown',
    this.isConnecting = false,
    this.iconImage = 'bt.jpg',
  });


  bool getIsConnected() {
    return this.isConnected;
  }

  bool getNewMyDeviceState() {
    return !this.myDevice;
  }

  bool getMyDeviceState() {
    return this.myDevice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          print('Bt element tapped');
          onConnectingStateChange(getIsConnected());
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
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
                SpinKitSpinningCircle(
                  color: Colors.grey[800],
                  size: 25.0,
                ) :
                Text(
                  isConnected ? 'connected'.tr() : 'notConnected'.tr(),
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
                  if (myDevice) {
                    dynamic result = await Navigator.pushNamed(
                      context,
                      "/about_bluetooth_device",
                      arguments: <String, String>{'bdAddr': bdAddr},
                    );
                    if(result != null) {
                      // switch
                      if (result['forgetDevice']) onMyDeviceChange();
                      else print(result['title']);
                    }
                  } else if (!myDevice) onOtherDeviceChange();
                },
                child: myDevice ? Icon(Icons.arrow_forward_ios, size: 25,) : Icon(Icons.add, size: 30,)
            ),
          ],
        ),
      ),
    );
  }
}
