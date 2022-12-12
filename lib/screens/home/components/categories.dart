import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/photoview/photoview_screen.dart';
import '../../../size_config.dart';
import 'package:shop_app/screens/home/components/catFlash/catgories_flash.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop_app/constants.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/user-svgrepo-com.svg",
        "text": "ประวัติผู้โดยสาร",
      },
      {"icon": "assets/icons/clipboard-svgrepo-com.svg", "text": "รายการจอง"},
      {"icon": "assets/icons/coupon-svgrepo-com.svg", "text": "คูปอง"},
      {
        "icon": "assets/icons/history-svgrepo-com.svg",
        "text": "ประวัติการเดินทาง"
      },
      {"icon": "assets/icons/Bill.svg", "text": "ประวัติชำระเงิน"},
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
                  press: () {
                    switch (categories[index]['text']) {
                      case 'Notification':
                        break;
                      default:
                    }
                  },
                ),
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
