import 'package:flutter/material.dart';
import 'package:carbook/screens/home/home_screen.dart';
import 'package:carbook/size_config.dart';
import 'package:lottie/lottie.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3200), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

    _controller = AnimationController(vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Center(
      child: Column(
        children: [
          Spacer(),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Lottie.asset(
            animate: true,
            repeat: false,
            'assets/lottie/loginSuccess.json',
            width: 300,
            height: 200,
            fit: BoxFit.contain,
            onLoaded: (composition) {
              _controller..duration = composition.duration;
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            "Login Success",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
