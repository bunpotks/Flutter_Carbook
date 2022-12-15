import 'package:flutter/material.dart';
import 'package:carbook/components/coustom_bottom_nav_bar.dart';
import 'package:carbook/enums.dart';

import 'components/body.dart';

class MessageScreen extends StatelessWidget {
  static String routeName = "/message";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: SizedBox(),
        title: Text("Message",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
            // textAlign: TextAlign.center,
            ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}
