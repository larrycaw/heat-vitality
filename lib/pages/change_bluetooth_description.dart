import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heat_vitality/classes/glove.dart';

class ChangeBluetoothDescription extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Controller for the TextField
    TextEditingController newValueController = new TextEditingController();

    // Get parameter sent (when asking to open this page)
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    Glove glove;

    if (arguments != null) {
      glove = arguments['glove'];
      newValueController.text = glove.getDesc;
    }

    // Save and go back to previous page
    void changeValue() {
      glove.setDesc = newValueController.text;
      Navigator.pop(context);
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
                  'description'.tr(),
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
              hintText: 'textHintDescription'.tr(),
            ),
          ),
          SizedBox(height: 70,),
          ElevatedButton(
            onPressed: () {
              if(newValueController.text == '' || newValueController.text == null) {
                // Tells the user that he/she must insert text
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'invalidValue'.tr(),
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
            child: Text('saveButton'.tr()),
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
