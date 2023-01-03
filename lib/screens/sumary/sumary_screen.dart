import 'package:carbook/screens/sumary/components/bottom.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class SumaryScreen extends StatelessWidget {
  static const routeName = '/sumary';
  static const title = 'Booking Confirmed';

  const SumaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Body(),
      bottomNavigationBar: PaymentDetail(),
    );
  }
}
