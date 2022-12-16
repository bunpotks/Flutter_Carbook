import 'package:flutter/material.dart';
import 'package:carbook/routes.dart';
import 'package:flutter/services.dart';
import 'package:carbook/screens/home/home_screen.dart';
import 'package:carbook/screens/sign_in/sign_in_screen.dart';
import 'package:carbook/screens/splash/splash_screen.dart';
import 'package:carbook/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'size_config.dart'

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
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = Locale('th');

  @override
  setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);

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
