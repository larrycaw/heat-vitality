import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangeBluetoothInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Controller for the TextField
    TextEditingController newValueController = new TextEditingController();

    // Get parameter sent (when asking to open this page)
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String infoToChange;

    if (arguments != null) {
      infoToChange = arguments['infoToChange'];
      newValueController.text = arguments['oldValue'];
    }

    // Send new value back to page that asked for it
    void changeValue() {
      if(infoToChange == 'name') {
        Navigator.pop(context, {
          'newName': newValueController.text,
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
              hintText: 'Enter a new name',
            ),
          ),
          SizedBox(height: 70,),
          ElevatedButton(
            onPressed: () {
              if(newValueController.text == '' || newValueController.text == null) {
                // Tells the user that he/she must insert text
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'The textfield must have a value',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    duration: const Duration(seconds: 8),
                    action: SnackBarAction(
                      label: 'HIDE',
                      onPressed: () {},
                    ),
                  ),
                );
              } else {
                changeValue();
              }
            },
            child: Text('Save'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
              backgroundColor: MaterialStateProperty.all(Color(0xFF03DAC5)),
              padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(28, 18, 28, 18)),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 21)),
            ),
          ),
        ],
      ),
    );
  }
}
