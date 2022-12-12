import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shop_app/screens/message/components/message_datail.dart';

class Body extends StatelessWidget {
  final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Hero(
                      tag: snapshot.data[index]['id'].toString(),
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  MessageDetail.routeName,
                                  arguments: ScreenArguments(
                                    snapshot.data[index],
                                  ),
                                );
                              },
                              title: Text(
                                  snapshot.data[index]['title'].toString()),
                              subtitle:
                                  Text(snapshot.data[index]['body'].toString()),
                              trailing:
                                  Text(snapshot.data[index]['id'].toString()),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
