import 'package:flutter/material.dart';
import 'package:carbook/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:carbook/screens/sign_in/sign_in_screen.dart';
import 'package:carbook/size_config.dart';
import 'package:carbook/components/switch_language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> splashData = [
      {
        "text": AppLocalizations.of(context)!.splash_desc1,
        "image": "assets/images/intros.gif"
      },
      {
        "text": AppLocalizations.of(context)!.splash_desc3,
        "image": "assets/images/tutorial3.gif"
      },
      {
        "text": AppLocalizations.of(context)!.splash_desc1,
        "image": "assets/images/tutorial2.gif"
      },
      {
        "text": AppLocalizations.of(context)!.splash_desc2,
        "image": "assets/images/sp_2.webp"
      },
    ];
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(10)),
            SwitchLang(),
            Expanded(
              flex: 5,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: AppLocalizations.of(context)!.splash_continue,
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                        // Navigator.pushNamed(context, '/otp');
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
