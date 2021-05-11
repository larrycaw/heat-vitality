import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:heat_vitality/classes/glove.dart';

class BtListElement extends StatelessWidget {

  final Glove glove;
  final VoidCallback onConnect;
  final VoidCallback onDisconnect;
  final VoidCallback onForgetDevice;
  final VoidCallback onUpdateBluetoothDevice;

  BtListElement({
    @required this.glove,
    @required this.onConnect,
    @required this.onDisconnect,
    this.onForgetDevice,
    this.onUpdateBluetoothDevice,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[300]),
          ),
      ),
      child: TextButton(
        onPressed: () {
          print('Bt element tapped');
          if(glove.myDevice) {
            if(glove.getIsConnected) onDisconnect();
            else onConnect();
          }
          else {
            onConnect();
          }
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
                        glove.getName,
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
                        glove.getDesc,
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
                glove.getIsConnecting ?
                SpinKitRing(//SpinKitPumpingHeart / SpinKitFadingCube
                  color: Color(0XFF67d0c6),
                  size: 25.0,
                ) :
                Text(
                  glove.getIsConnected ? 'connected'.tr() : 'notConnected'.tr(),
                  style: TextStyle(
                      color: Colors.grey[700]
                  ),
                ),
                SizedBox(width: 20,)
              ],
            ),
            GestureDetector(
                onTap: () async {
                  print('Icon tapped');
                  if (glove.getMyDeviceState) {
                    dynamic result = await Navigator.pushNamed(
                      context,
                      "/about_bluetooth_device",
                      arguments: <String, Glove>{'glove': glove},
                    );
                    if(result != null) {
                      if (result['forgetDevice']) onForgetDevice();
                    } else onUpdateBluetoothDevice();
                  }
                },
                child: glove.getMyDeviceState ? Icon(Icons.arrow_forward_ios, size: 22) : Icon(null),
            ),
            SizedBox(width: 20,)
          ],
        ),
      ),
    );
  }
}
