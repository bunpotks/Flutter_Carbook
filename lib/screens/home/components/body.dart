import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'promotion_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';
import 'promotion.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Stack(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(30)),
                    HomeHeader(),
                    SizedBox(height: getProportionateScreenWidth(30)),
                    SpecialOffers(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    Categories(),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Promotion(),
                    // SizedBox(height: getProportionateScreenWidth(30)),
                    // Promotion(),
                    SizedBox(height: getProportionateScreenWidth(30)),
                    // PopularProducts(),
                    // SizedBox(height: getProportionateScreenWidth(30)),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
