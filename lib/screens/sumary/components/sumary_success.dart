import 'package:flutter/material.dart';
import 'package:carbook/screens/home/home_screen.dart';
import 'package:carbook/size_config.dart';
import 'package:lottie/lottie.dart';

class SummarySuccess extends StatefulWidget {
  static const routeName = '/summarysuccrss';
  const SummarySuccess({super.key});

  @override
  State<SummarySuccess> createState() => _SummarySuccessState();
}

class _SummarySuccessState extends State<SummarySuccess>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2800), () {
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
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Lottie.asset(
              animate: true,
              repeat: true,
              'assets/lottie/paymentsuccess2.json',
              width: getProportionateScreenWidth(300),
              height: getProportionateScreenWidth(300),
              fit: BoxFit.contain,
              // onLoaded: (composition) {
              //   _controller..duration = composition.duration;
              // },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Text(
              "Payment Success",
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
      ),
    );
  }
}
