import 'package:carbook/screens/details/components/custom_app_bar.dart';
import 'package:carbook/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'booking_form.dart';

class BookTrip1Screen extends StatefulWidget {
  const BookTrip1Screen({super.key});
  static const String routeName = '/bookingtrip1';

  @override
  State<BookTrip1Screen> createState() => _BookTrip1ScreenState();
}

class _BookTrip1ScreenState extends State<BookTrip1Screen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final BookTrip1ScreenArguments data =
        BookTrip1ScreenArguments.fromJson(args);

    return Scaffold(
        appBar: AppBar(
          title: Text(data.category),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  data.image,
                  height: getProportionateScreenWidth(250),
                ),
                BookingForm(),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }
}

class BookTrip1ScreenArguments {
  late String image;
  late String category;
  late String desc;
  late String tag;

  BookTrip1ScreenArguments(
      {required this.image, required this.category, required this.desc});

  BookTrip1ScreenArguments.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    category = json['category'];
    desc = json['desc'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['category'] = this.category;
    data['desc'] = this.desc;
    data['tag'] = this.tag;

    return data;
  }
}
