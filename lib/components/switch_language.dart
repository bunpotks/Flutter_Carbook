import 'package:shop_app/main.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class SwitchLang extends StatelessWidget {
  const SwitchLang({super.key});

  @override
  Widget build(BuildContext context) {
    String myLocale = Localizations.localeOf(context).toString();
    return Container(
      child: Padding(
        padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                MyApp.setLocale(context, Locale('th'));
              },
              child: Text(
                'TH',
                style: (TextStyle(
                    color: myLocale == 'th' ? Colors.blue : Colors.black)),
              ),
            ),
            Text(' | '),
            GestureDetector(
              onTap: () {
                MyApp.setLocale(context, Locale('en'));
              },
              child: Text('EN',
                  style: (TextStyle(
                      color: myLocale == 'en' ? Colors.blue : Colors.black))),
            ),
          ],
        ),
      ),
    );
  }
}
