import 'package:carbook/service/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TestApiModel {
  String? id;
  String? data;
  String? desc;

  TestApiModel({this.id, this.data, this.desc});

  TestApiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['desc'] = this.desc;
    return data;
  }
}

class TestPost extends StatefulWidget {
  static final routeName = '/testpost';

  const TestPost({super.key});

  @override
  State<TestPost> createState() => _TestPostState();
}

class _TestPostState extends State<TestPost> {
  TestApiModel? apiData;
  getTestApi() async {
    final String url = 'http://localhost:8888/testapi/testapi.php';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);

      if (res['status'] == 'success') {
        return TestApiModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } else {
      return null;

      // If the server did not return a 201 CREATED response,
      // then throw an exception
      // return [];
      // .
    }
  }

  @override
  Widget build(BuildContext context) {
    Press() async {
      getTestApi().then((value) {
        if (value != null) {
          setState(() {
            apiData = value;
          });
        } else {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomConfirmDialog(
              title: 'แจ้งเตือน',
              desc: 'ไม่สามารถเชื่อมต่อข้อมูลได้ กรุณาลองใหม่อีกครั้ง',
              press: () {
                Navigator.pop(context);
              },
              cancel: () {
                Navigator.pop(context);
              },
            ),
          );
        }
      });

      // setState(() {});
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(child: Text('Post'), onPressed: Press),
            if (apiData != null) (Text(apiData!.data!)),
          ],
        ),
      ),
    );
  }
}
