import 'package:carbook/screens/book_trip/booktrip_1.dart';
import 'package:flutter/material.dart';
import 'package:carbook/screens/home/components/catFlash/catgories_flash.dart';
import 'package:carbook/screens/blank/blank_screen.dart';
import '../../../size_config.dart';
import 'section_title.dart';
import 'package:page_transition/page_transition.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Booking",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Hero(
                tag: "OneWay",
                child: SpecialOfferCard(
                    image: "assets/images/taxi3.jpeg",
                    category: "One Way Trip",
                    desc: "travel to a single destination",
                    press: () {
                      Navigator.pushNamed(context, BookTrip1Screen.routeName,
                          arguments: {
                            "tag": "OneWay",
                            "image": "assets/images/one_way.webp",
                            "category": "One Way Trip",
                            "desc": "travel to a single destination",
                          });
                    }),
              ),
              Hero(
                tag: "RoundTrip",
                child: SpecialOfferCard(
                    image: "assets/images/taxi2.webp",
                    category: "Round Trip",
                    desc:
                        "Travel to the destination and return to the same point.",
                    press: () {
                      Navigator.pushNamed(context, BookTrip1Screen.routeName,
                          arguments: {
                            "tag": "RoundTrip",
                            "image": "assets/images/two_way.webp",
                            "category": "Round Trip",
                            "desc":
                                "Travel to the destination and return to the same point.",
                          });

                      // Navigator.pushNamed(
                      //     context, CatgoriesFlashScreen.routeName);
                    }),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.desc,
    required this.press,
  }) : super(key: key);

  final String category, image, desc;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(260),
          height: getProportionateScreenWidth(130),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: getProportionateScreenWidth(260),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.2),
                        Color(0xFF343434).withOpacity(0.1),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$desc")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
