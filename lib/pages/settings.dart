import 'package:flutter/material.dart';
import 'package:glove_control/widget_element/app_bar.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:glove_control/variables/global_variables.dart';
import 'package:easy_localization/easy_localization.dart';

class Settings extends StatefulWidget {
  final Function(String) newLanguage;

  Settings({@required this.newLanguage});

  @override
  _SettingsState createState() => _SettingsState();
}


class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]),
              ),
            ),
            padding: EdgeInsets.only(top: 130, bottom: 30),
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 25),
                    Text(
                      "darkMode".tr() + ":",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Transform.scale(
                        scale: 1.3,
                        child: Switch(
                          value: darkModeOn,
                          onChanged: (value) {
                            setState(() {
                              darkModeOn = value;
                              print(darkModeOn);
                            });
                          },
                          activeTrackColor: Colors.deepPurpleAccent[100],
                          activeColor: Color(0XFF571fe4),
                        ),
                      ),
                      SizedBox(width: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 22),
                    Text(
                      ('language').tr() + ":",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 40,
                          underline: SizedBox(),
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                          value: 'currentLanguage'.tr(),
                          onChanged: (newLanguage) {
                            setState(() {
                              print('New language: $newLanguage');
                              this.widget.newLanguage(newLanguage);
                            });
                          },
                          items: language.map((key, value) {
                            return MapEntry(
                              key,
                              DropdownMenuItem(
                                value: key,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('$flagPath${language[key]['flagPath']}'),
                                    ),
                                    SizedBox(width: 12,),
                                    Text(key),
                                  ],
                                ),
                              ),
                            );
                          }).values.toList(),
                        ),
                      ),
                      SizedBox(width: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
