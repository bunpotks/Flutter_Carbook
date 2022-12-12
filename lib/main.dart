import 'package:flutter/material.dart';
import 'package:shop_app/routes.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

bool? is_Login;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  SharedPreferences prefs = await SharedPreferences.getInstance();
  is_Login = await prefs.getBool('is_logged_in') != null ? true : false;
  runApp(MyApp(isLogin: is_Login));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.isLogin}) : super(key: key);
  final bool? isLogin;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('th');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      locale: _locale,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('th', ''), // Spanish, no country cod
      ],
      initialRoute:
          widget.isLogin! ? HomeScreen.routeName : SplashScreen.routeName,
      routes: routes,
    );
  }
}
