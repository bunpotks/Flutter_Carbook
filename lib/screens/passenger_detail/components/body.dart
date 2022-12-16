import 'package:carbook/screens/passenger_profile/components/passenger.dart';
import 'package:carbook/theme.dart';
import 'package:flutter/material.dart';
import 'package:carbook/size_config.dart';

class Body extends StatelessWidget {
  final Passenger passenger;

  const Body({Key? key, required this.passenger}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        PassengerPicture(context),
        SizedBox(height: getProportionateScreenHeight(20)),
      ]),
    );
  }

  Container PassengerPicture(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Hero(
          tag: passenger.email!,
          child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  // borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(passenger.picture!.large!)))),
        ));
  }
}
