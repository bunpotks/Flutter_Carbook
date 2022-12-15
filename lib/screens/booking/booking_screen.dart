import 'package:flutter/material.dart';
import 'components/body.dart';

class BookingScreen extends StatelessWidget {
  static const routeName = '/booking';
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking')),
      body: Body(),
    );
  }
}
