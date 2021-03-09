import 'package:flutter/material.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(width: 25),
                      Text(
                        "darkModeLabel".tr() + ":",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LiteRollingSwitch(
                        value: darkModeOn,
                        textOn: 'darkModeOn'.tr(),
                        textOff: 'darkModeOff'.tr(),
                        colorOn: Colors.deepPurple[600],
                        colorOff: Colors.amber[700],
                        iconOn: Icons.nightlight_round,
                        iconOff: Icons.wb_sunny,
                        textSize: 18,
                        onChanged: (bool nightModeState) {
                          print('Night mode on? $nightModeState');
                        },
                      ),
                      SizedBox(width: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      SizedBox(width: 25),
                      Text(
                        ('LanguageLabel').tr() + ":",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton(
                          dropdownColor: Colors.grey[200],
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 40,
                          underline: SizedBox(),
                          style: TextStyle(
                            fontSize: 23,
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
                                      backgroundImage: AssetImage('assets/flags/${language[key]['flagPath']}'),
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
