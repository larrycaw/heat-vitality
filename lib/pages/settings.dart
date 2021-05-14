import 'package:flutter/material.dart';
import 'package:heat_vitality/widget_element/app_bar.dart';
import 'package:heat_vitality/variables/global_variables.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heat_vitality/widget_element/advertisement_at_ease.dart';

class Settings extends StatefulWidget {
  final Function(String) newLanguage;

  Settings({this.newLanguage});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Case for every language option, (remember to also change at main.dart)
  void setLanguage(String newLanguage) {
    switch (newLanguage) {
      case 'English':
        context.locale = Locale('en', 'GB');
        break;
      case 'Norsk':
        context.locale = Locale('no', 'NO');
        break;
      case 'Sámegilli':
        context.locale = Locale('smi', 'NO');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('mySettings'.tr(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
              ],
            ),
          )),
          Container(
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
                              setLanguage(newLanguage);
                            });
                          },
                          items: language
                              .map((key, value) {
                                return MapEntry(
                                  key,
                                  DropdownMenuItem(
                                    value: key,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              '$flagPath${language[key]['flagPath']}'),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(key),
                                      ],
                                    ),
                                  ),
                                );
                              })
                              .values
                              .toList(),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AdvertisementAtEase(),
        ],
      ),
    );
  }
}
