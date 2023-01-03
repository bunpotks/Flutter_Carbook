import 'package:carbook/constants.dart';
import 'package:carbook/screens/home/components/special_offers.dart';
import 'package:carbook/screens/sumary/components/sumary_success.dart';
import 'package:carbook/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              BookingRoute(context),
              SizedBox(
                height: 20,
              ),
              BookingDetail(context),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget BookingRoute(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Route',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: kSecondaryColor,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Siam Paragon',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '991 ถ. พระรามที่ ๑ แขวง ปทุมวัน เขตปทุมวัน กรุงเทพมหานคร 10330',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  color: kSecondaryColor,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: kSecondaryColor,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'centralwOrld',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '4, 5 ถนน ราชดำริ แขวง ปทุมวัน เขตปทุมวัน กรุงเทพมหานคร 10330',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget BookingDetail(context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ('Booking Details'),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
            ),
          ],
        ),
        ListTile(
          onTap: () => print('hello'),
          leading: Icon(
            Icons.menu_book,
            size: 24,
          ),
          title: Text(
            'Package',
            style: TextStyle(fontSize: 14),
          ),
          subtitle: Text(
            'One Way Trip',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.people,
            size: 24,
          ),
          title: Text(
            'Passenger',
            style: TextStyle(fontSize: 14),
          ),
          subtitle: Text(
            'Christopher Nolan',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.calendar_month_outlined,
            size: 24,
          ),
          title: Text(
            'Departure',
            style: TextStyle(fontSize: 14),
          ),
          subtitle: Text(
            '20/01/2023 15:00',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        ),
      ]),
    );
  }
}

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            height: 210,
            child: SafeArea(top: true, child: PaymentDetails(context))));
  }

  Widget PaymentDetails(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Payment Summary',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal'),
                        Text('399.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount'),
                        Text('0.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total'),
                        Text('399.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
            Container(
                width: double.infinity,
                height: getProportionateScreenWidth(50),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      SummarySuccess.routeName,
                      ((Route<dynamic> route) => false)),
                  child: Text(
                    'Confirm',
                    style: TextStyle(fontSize: 16),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
