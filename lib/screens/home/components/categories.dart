import 'package:carbook/screens/booking/booking_screen.dart';
import 'package:carbook/screens/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../size_config.dart';
import 'package:carbook/constants.dart';
import 'package:carbook/screens/passenger_profile/passengerprofille_screen.dart';
import 'package:carbook/screens/coupon/coupon_screen.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/user-svgrepo-com.svg",
        "text": "ประวัติผู้โดยสาร",
        "press": () =>
            Navigator.pushNamed(context, PassengerProfileScreen.routeName),
      },
      {
        "icon": "assets/icons/clipboard-svgrepo-com.svg",
        "text": "รายการจอง",
        "press": () => Navigator.pushNamed(context, BookingScreen.routeName),
      },
      {
        "icon": "assets/icons/coupon-svgrepo-com.svg",
        "text": "คูปอง",
        "press": () => Navigator.pushNamed(context, CouponScreen.routeName),
      },
      {
        "icon": "assets/icons/history-svgrepo-com.svg",
        "text": "ประวัติ",
        "press": () => Navigator.pushNamed(context, HistoryScreen.routeName),
      },
      // {"icon": "assets/icons/Bill.svg", "text": "ประวัติชำระเงิน"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(0)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                categories.length,
                (index) => CategoryCard(
                    icon: categories[index]["icon"],
                    text: categories[index]["text"],
                    press: categories[index]["press"]),
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(20))
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(60),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                height: getProportionateScreenWidth(60),
                width: getProportionateScreenWidth(60),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(icon!),
              ),
              SizedBox(height: 5),
              Text(text!, textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
