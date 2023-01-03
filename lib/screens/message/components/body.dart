import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:carbook/screens/message/components/message_datail.dart';
import 'post.dart';
import 'package:carbook/screens/passenger_profile/components/passenger.dart';

final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

Future<List<Post>> fetchUsers() async {
  final response = await http.get(Uri.parse(apiUrl));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Post> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

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
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // throw Exception('Failed to load album');
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: fetchPassenger(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // Passenger pData = snapshot.data[0];
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(snapshot.data[index].gender);
                    // return Text(snapshot.data[index].toString());
                  });

              // return ListView.builder(
              //     padding: EdgeInsets.all(8),
              //     itemCount: snapshot.data.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       final Post pData = snapshot.data[index];

              //       return Hero(
              //         tag: pData.id,
              //         child: Card(
              //           child: Column(
              //             children: [
              //               ListTile(
              //                 onTap: () {
              //                   // Navigator.pushNamed(
              //                   //   context,
              //                   //   MessageDetail.routeName,
              //                   //   arguments: ScreenArguments(
              //                   //     pData,
              //                   //   ),
              //                   // );
              //                 },
              //                 title: Text(pData.title),
              //                 subtitle: Text(pData.body.toString()),
              //                 trailing: Text(pData.id.toString()),
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
