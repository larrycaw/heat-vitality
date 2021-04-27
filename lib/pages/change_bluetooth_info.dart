import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangeBluetoothInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Controller for the Textfield
    TextEditingController newValueController = new TextEditingController();

    // Get parameter sent (when asking to open this page)
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String bdAddr;
    String infoToChange;
    String oldValue;

    if (arguments != null) {
      bdAddr = arguments['bdAddr'];
      infoToChange = arguments['infoToChange'];
      newValueController.text = arguments['oldValue'];
    }

    // Send new value back to page that asked for it
    void changeValue() {
      if(infoToChange == 'title') {
        Navigator.pop(context, {
          'newTitle': newValueController.text,
        });
      } else if(infoToChange == 'description') {
        Navigator.pop(context, {
          'newDescription': newValueController.text,
        });
      }
    }


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => changeValue(),
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
          TextField(
            controller: newValueController,
            style: TextStyle(
                fontSize: 20.0,
                height: 2.0,
                color: Colors.black
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
              hintText: 'Enter a new title',
            ),
          ),
        ],
      ),
    );
  }
}
