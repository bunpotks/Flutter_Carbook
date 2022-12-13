import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  _BodyFromState createState() => _BodyFromState();
}

class _BodyFromState extends State<Body> {
  dynamic prefs = false;

  @override
  initState() {
    super.initState();
    asyncMethod();
  }

  void asyncMethod() async {
    prefs = await SharedPreferences.getInstance();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
              await prefs.remove('is_logged_in');

              // Navigator.popAndPushNamed(context, SplashScreen.routeName);
              // Navigator.pushNamedAndRemoveUntil(context, SplashScreen.routeName,
              //     ModalRoute.withName(SplashScreen.routeName));

              // Navigator.of(context).pushAndRemoveUntil(
              //     CupertinoPageRoute(builder: (context) => SplashScreen()),
              //     (Route<dynamic> route) => false);

              // Navigator.popUntil(
              //     context, ModalRoute.withName(Navigator.defaultRouteName));

              Navigator.pushReplacementNamed(context, SplashScreen.routeName);

              // Navigator.popAndPushNamed(context, SplashScreen.routeName);
              // Navigator.pushNamedAndRemoveUntil(context, SplashScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
