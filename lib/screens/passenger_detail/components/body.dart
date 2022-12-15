import 'package:carbook/screens/passenger_profile/components/passenger.dart';
import 'package:carbook/theme.dart';
import 'package:flutter/material.dart';
import 'package:carbook/size_config.dart';

class Body extends StatelessWidget {
  final Passenger passenger;

  const Body({Key? key, required this.passenger}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: getProportionateScreenWidth(200),
              height: getProportionateScreenHeight(200),
              child: Hero(
                  tag: passenger.email,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                        maxHeight: 200,
                      ),
                      color: Theme.of(context).primaryColor,
                      child: Image.network(
                        passenger.picture.large,
                        fit: BoxFit.cover,
                        width: getProportionateScreenHeight(200),
                        height: getProportionateScreenHeight(200),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
