import 'package:flutter/material.dart';
import 'components/body.dart';

class CouponScreen extends StatelessWidget {
  static const routeName = '/coupon';
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('coupon screen')),
      body: Body(),
    );
  }
}
