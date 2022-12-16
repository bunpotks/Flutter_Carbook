import 'package:flutter/material.dart';
import 'package:carbook/components/default_button.dart';
import 'package:carbook/screens/home/home_screen.dart';
import 'package:carbook/size_config.dart';
import 'package:lottie/lottie.dart';
// import 'package:page_transition/page_transition.dart';

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
      // ..repeat(
      //   min: 1.0,
      //   max: 3.0,
      //   reverse: true,
      //   period: _controller.duration! * (3.0 - 1.0),
      // )
      // ..value = 0.1
      ..addListener(() {
        setState(() {
          // Rebuild the widget at each frame to update the "progress" label.
        });
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
            // controller: _controller,
            onLoaded: (composition) {
              _controller..duration = composition.duration;
              // var start = 0.3;
              // var stop = 1.0;
              // _controller.repeat(
              //   min: start,
              //   max: stop,
              //   period: _controller.duration! * (stop - start),
              // );
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
          // SizedBox(
          //   width: SizeConfig.screenWidth * 0.9,
          //   child: DefaultButton(
          //     text: "Go to Menu",
          //     press: () {
          //       Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          //     },
          //   ),
          // ),
          Spacer(),
        ],
      ),
    );
  }
}

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Spacer(),
//           SizedBox(height: SizeConfig.screenHeight * 0.04),
//           Lottie.asset(
//             animate: true,
//             repeat: false,
//             'assets/lottie/loginSuccess.json',
//             width: 300,
//             height: 200,
//             fit: BoxFit.contain,
//           ),
//           // Image.asset(
//           //   "assets/images/success.png",
//           //   // height: SizeConfig.screenHeight * 0.4, //40%
//           // ),
//           SizedBox(height: SizeConfig.screenHeight * 0.08),
//           Text(
//             "Login Success",
//             style: TextStyle(
//               fontSize: getProportionateScreenWidth(30),
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           Spacer(),
//           SizedBox(
//             width: SizeConfig.screenWidth * 0.9,
//             child: DefaultButton(
//               text: "Go to Menu",
//               press: () {
//                 Navigator.pushReplacementNamed(context, HomeScreen.routeName);
//               },
//             ),
//           ),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }
