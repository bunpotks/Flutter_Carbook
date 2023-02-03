import 'dart:async';
import 'dart:io';
import 'package:carbook/constants.dart';
import 'package:carbook/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _linuxIconPathController =
      TextEditingController();

  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  // Future<void> _configureDidReceiveLocalNotificationSubject() async {
  //   didReceiveLocalNotificationStream.stream
  //       .listen((ReceivedNotification receivedNotification) async {
  //     await showDialog(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: receivedNotification.title != null
  //             ? Text(receivedNotification.title!)
  //             : null,
  //         content: receivedNotification.body != null
  //             ? Text(receivedNotification.body!)
  //             : null,
  //         actions: <Widget>[
  //           CupertinoDialogAction(
  //             isDefaultAction: true,
  //             onPressed: () async {
  //               Navigator.of(context, rootNavigator: true).pop();
  //               await Navigator.pushNamed(context, BlankScreen.routeName);
  //             },
  //             child: const Text('Ok'),
  //           )
  //         ],
  //       ),
  //     );
  //   });
  // }

  // void _configureSelectNotificationSubject() {
  //   selectNotificationStream.stream.listen((String? payload) async {
  //     await Navigator.of(context).push(MaterialPageRoute<void>(
  //       builder: (BuildContext context) => PayloadScreen(payload),
  //     ));
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> bookingList = [
      {
        "id": 1,
        "bookingType": 'One Way Trip',
        "route": {
          "routeStart": "Siam Paragon",
          "routeTo": "The Mall Thapra",
          "start": "2022-12-12 15:00",
          "end": "2022-12-12 18:00",
          "duration": "3 Hrs"
        },
        "price": "459.00",
      },
      {
        "id": 2,
        "bookingType": 'One Way Trip',
        "route": {
          "routeStart": "Suvarnabhumi",
          "routeTo": "Donmueang  Airport",
          "start": "2022-12-20 08:00",
          "end": "2022-12-29 10:00",
          "duration": "2 Hrs"
        },
        "price": "459.00",
      },
      {
        "id": 3,
        "bookingType": 'One Way Trip',
        "route": {
          "routeStart": "Terminal 21",
          "routeTo": "Central Rama3",
          "start": "2022-12-12 15:00",
          "end": "2022-12-12 18:00",
          "duration": "3 Hrs"
        },
        "price": "229.00",
      },
      {
        "id": 5,
        "bookingType": 'One Way Trip',
        "route": {
          "routeStart": "Siam Paragon",
          "routeTo": "The Mall Thapra",
          "start": "2023-01-25 15:00",
          "end": "2022-01-25 18:00",
          "duration": "3 Hrs"
        },
        "price": "459.00",
      },
    ];
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
            itemCount: bookingList.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () => print(index),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            RouteTypeRow(context, bookingList, index),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            RouteNameRow(context, bookingList, index),
                            SizedBox(height: getProportionateScreenHeight(20)),
                            RouteTimeRow(context, bookingList, index),
                            Divider(),
                            TotalRow(context, bookingList, index),
                          ],
                        ),
                      ),
                    )),
              );
            })),
      ),
    );
  }

  Container RouteTypeRow(BuildContext context,
      List<Map<dynamic, dynamic>> bookingList, int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text(
        bookingList[index]['bookingType'],
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }

  Container RouteNameRow(BuildContext context,
      List<Map<dynamic, dynamic>> bookingList, int index) {
    const txTimeStyle = TextStyle(
        color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 16);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Text(
            bookingList[index]['route']['routeStart'],
            style: txTimeStyle,
          )),
          Container(
              child: Icon(
            Icons.send_sharp,
            color: Colors.grey[500],
            size: 18,
          )),
          Container(
              child: Text(
            bookingList[index]['route']['routeTo'],
            style: txTimeStyle,
          )),
        ],
      ),
    );
  }

  Container RouteTimeRow(BuildContext context,
      List<Map<dynamic, dynamic>> bookingList, int index) {
    const txTimeStyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Column(
            children: [
              Text('Depart', style: TextStyle(fontSize: 12)),
              Text(
                  DateFormat('HH:M').format(
                    DateTime.parse(
                      bookingList[index]['route']['start'],
                    ),
                  ),
                  style: txTimeStyle)
            ],
          )),
          Container(
              child: Text(bookingList[index]['route']['duration'],
                  style: TextStyle(fontSize: 16))),
          Container(
              child: Column(
            children: [
              Text('Depart', style: TextStyle(fontSize: 12)),
              Text(
                DateFormat('HH:M')
                    .format(DateTime.parse(bookingList[index]['route']['end'])),
                style: txTimeStyle,
              )
            ],
          )),
        ],
      ),
    );
  }

  Container TotalRow(BuildContext context,
      List<Map<dynamic, dynamic>> bookingList, int index) {
    const txTimeStyle = TextStyle(
        color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 22);

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Column(
            children: [
              Text('฿ ' + bookingList[index]['price'], style: txTimeStyle)
            ],
          )),
          Container(
              child: Column(
            children: [
              Text("View Detail", style: TextStyle(color: Colors.grey))
            ],
          )),
        ],
      ),
    );
  }

  Widget BtnNoti() {
    return Column(
      children: [
        ElevatedButton(child: Text('BasicNotification'), onPressed: () {}),
        ElevatedButton(child: Text('Repeat'), onPressed: () {})
      ],
    );
  }
}
