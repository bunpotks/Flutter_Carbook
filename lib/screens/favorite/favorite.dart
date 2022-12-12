import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';

import 'components/body.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = "/favorite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: SizedBox(),
        title: Text("Favorite",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
            // textAlign: TextAlign.center,
            ),
        // backgroundColor: Colors.blue,
      ),
      body: Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
