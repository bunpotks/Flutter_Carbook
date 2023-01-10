import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';
import 'coupon_discount.dart';

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: SectionTitle(title: "Coupon", press: () {}),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        CouponDiscount()
      ],
    );
  }
}
