import 'package:flutter/material.dart';

import '../../../../size_config.dart';
// import '../categories.dart';
// import '../discount_banner.dart';
// import '../home_header.dart';
import '../popular_product.dart';
// import '../special_offers.dart';

class CatgoriesFlashScreen extends StatelessWidget {
  static String routeName = "/catgorieflash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catgories",
          // style: Colors.blue,
        ),
      ),
      body: CatgoriesFlash(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

class CatgoriesFlash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // print("Focus");
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: getProportionateScreenHeight(20)),
                // HomeHeader(),
                // SizedBox(height: getProportionateScreenWidth(10)),
                // DiscountBanner(),
                // Categories(),
                // SpecialOffers(),
                SizedBox(height: getProportionateScreenWidth(20)),
                PopularProducts(),
                SizedBox(height: getProportionateScreenWidth(30)),
              ],
            ),
          ),
        ));
  }
}
