import 'package:carbook/screens/passenger_detail/passenger_detail.dart';
import 'package:carbook/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carbook/api/fetch_passenger.dart';
import 'passenger.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<List<dynamic>> _post;

  Future<List<Passenger>> fetchPassenger() async {
    var apiUrl = 'https://randomuser.me/api/?results=10';
    var result = await http.get(Uri.parse(apiUrl));
    var res = jsonDecode(result.body)['results'];
    List<Passenger> userList =
        List<Passenger>.from(res.map((model) => Passenger.fromJson(model)))
            .toList();
    return userList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<Passenger>>(
          future: fetchPassenger(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemCard(context, snapshot.data[index], index);
                    // return Text(snapshot.data[index].toString());
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Widget ItemCard(context, Passenger data, index) {
    // return Text(data.gender);
    return Card(
        child: ListTile(
      onTap: () {
        Navigator.pushNamed(context, PassengerDetail.routeName,
            arguments: PassengerDetailsArguments(passenger: data));
      },
      leading: Hero(
        tag: data.email,
        child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data.picture.large)))),
      ),
      title:
          Text(data.name.title + ' ' + data.name.first + ' ' + data.name.last),
      subtitle: Text(data.location.country),
    ));
  }
}
