import 'package:carbook/screens/passenger_detail/passenger_detail.dart';
import 'package:carbook/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'passenger.dart';
import 'package:shimmer/shimmer.dart';

Future<List<Passenger>> fetchPassenger() async {
  var apiUrl = 'https://randomuser.me/api/?results=10';
  var result = await http.get(Uri.parse(apiUrl));

  if (result.statusCode == 200) {
    var res = await jsonDecode(result.body)['results'];
    List<Passenger> userList = await List<Passenger>.from(
        res.map((model) => Passenger.fromJson(model))).toList();
    return userList;
  } else {
    return [];
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<List<Passenger>> _dataFuture = fetchPassenger();

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return ItemFuture();
  }

  FutureBuilder<List<Passenger>> ItemFuture() {
    return FutureBuilder<List<Passenger>>(
      future: _dataFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Passenger passengerData = snapshot.data![index];
                return ItemCard(context, passengerData, index);
              });
        } else {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: ListView.builder(
                itemBuilder: (_, __) => Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(48.0))),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: 40.0,
                              height: 8.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: 15,
              ),
            ),
          );
        }
      },
    );
  }

  Widget ItemCard(context, Passenger data, index) {
    return Card(
        child: ListTile(
      onTap: () {
        // Navigator.pop(context, data);
        Navigator.pushNamed(context, PassengerDetail.routeName,
            arguments: PassengerDetailsArguments(passenger: data));
      },
      leading: Hero(
        tag: data.email!,
        child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data.picture!.large!)))),
      ),
      title: Text(
          data.name!.title! + ' ' + data.name!.first! + ' ' + data.name!.last!),
      subtitle: Text(data.location!.country!),
    ));
  }
}
