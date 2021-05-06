import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:heat_vitality/variables/global_variables.dart';

class AdvertisementAtEase extends StatelessWidget {
  void goToAtEaseWebsite() async{
    if (await canLaunch(urlAtEase)) {
      print('Trying to launch');
      await launch(urlAtEase);
    }
    else
      // can't launch url, there is some error
      throw "Could not launch $urlAtEase";
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 84,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onSurface: Colors.grey,
              ),
              onPressed: (){
                print('Link button pressed');
                goToAtEaseWebsite();
              },
              child: Image.asset(logoPath + atEaseLogo),
            ),
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
