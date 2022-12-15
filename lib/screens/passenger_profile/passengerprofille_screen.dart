import 'package:flutter/material.dart';
import 'components/body.dart';

class PassengerProfileScreen extends StatelessWidget {
  static const routeName = '/passenger_profile';
  const PassengerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PassengerProfile')),
      body: Body(),
    );
  }
}
