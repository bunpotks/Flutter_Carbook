import 'package:carbook/screens/passenger_detail/passenger_detail.dart';
import 'package:carbook/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
// import 'shimer_loading.dart';
import 'package:http/http.dart' as http;
import 'passenger.dart';
import 'package:shimmer/shimmer.dart';

// class Post {
//   int? userId;
//   int? id;
//   String? title;
//   String? body;

//   Post({this.userId, this.id, this.title, this.body});

//   Post.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     id = json['id'];
//     title = json['title'];
//     body = json['body'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['body'] = this.body;
//     return data;
//   }
// }

// Future<List<Post>> fetchPassenger() async {
//   var apiUrl = 'https://jsonplaceholder.typicode.com/posts';
//   var result = await http.get(Uri.parse(apiUrl));

//   if (result.statusCode == 200) {
//     var res = await jsonDecode(result.body);
//     List<Post> userList =
//         await List<Post>.from(res.map((model) => Post.fromJson(model)))
//             .toList();

//     // print(userList);
//     return userList;
//   } else {
//     return [];
//   }
// }

// class Body extends StatefulWidget {
//   const Body({super.key});

//   @override
//   State<Body> createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   late Future<List<Post>> _dataFuture = fetchPassenger();
//   late List<Post> dataList;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _dataFuture,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.hasData) {
//           dataList = snapshot.data!;
//           return ListView.builder(
//               padding: EdgeInsets.all(8),
//               itemCount: snapshot.data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 Post dataa = snapshot.data![index];

//                 return ListTile(
//                   onTap: (() {
//                     setState(() {
//                       dataa.userId = 333;
//                     });
//                   }),
//                   title: Text(dataa.userId.toString()),
//                   subtitle: Text(dataa.body.toString()),
//                   leading: Text(dataList[index].id.toString()),
//                 );
//               });
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

// class Items {
//   late String? id;

//   Items({required this.id});

//   Items.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id.toString();
//     return data;
//   }
// }

// class _BodyState extends State<Body> {
//   List<Items> items = [
//     Items(id: "1"),
//     Items(id: "2"),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           onTap: () => setState(() {
//             // print(items);
//             // items.add(Items(id: (index + 1).toString()));
//             items.removeAt(index);
//           }),
//           title: Text(items[index].id.toString()),
//         );
//       },
//     );
//   }
// }

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
