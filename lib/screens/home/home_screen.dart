import 'package:flutter/material.dart';
import 'package:carbook/components/coustom_bottom_nav_bar.dart';
import 'package:carbook/enums.dart';
import 'components/body.dart';
import 'package:carbook/size_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
