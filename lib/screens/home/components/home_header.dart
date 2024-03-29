import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:carbook/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import 'package:page_transition/page_transition.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.amber),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SearchField(),
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user.jpeg"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'John Steve',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            // IconBtnWithCounter(
            //   svgSrc: "assets/icons/Cart Icon.svg",
            //   press: () => {Navigator.pushNamed(context, CartScreen.routeName)},
            // ),
            // IconBtnWithCounter(
            //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
            //   svgSrc: "assets/icons/Bell.svg",
            //   numOfitem: 2,
            // ),
          ],
        ),
      ),
    );
  }
}
