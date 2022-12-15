import 'package:flutter/material.dart';
import '../passenger_profile/components/passenger.dart';
import 'components/body.dart';

class PassengerDetail extends StatelessWidget {
  static String routeName = "/passengerdetail";

  @override
  Widget build(BuildContext context) {
    final PassengerDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as PassengerDetailsArguments;
    // print(agrs);
    return Scaffold(
      appBar: AppBar(
        title: Text(agrs.passenger.name.first + ' ' + agrs.passenger.name.last),
      ),
      body: Body(passenger: agrs.passenger),
    );
  }
}

class PassengerDetailsArguments {
  final Passenger passenger;

  PassengerDetailsArguments({required this.passenger});
}
