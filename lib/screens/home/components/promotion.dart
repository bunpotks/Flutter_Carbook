import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';
import 'promotion_banner.dart';

class Promotion extends StatelessWidget {
  const Promotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SectionTitle(title: "Promotions", press: () {}),
      ),
      // SizedBox(height: getProportionateScreenWidth(20)),
      PromotionBaner()
    ]);
  }
}
