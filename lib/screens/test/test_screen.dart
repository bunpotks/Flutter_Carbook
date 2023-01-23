import 'package:carbook/service/alert_dialog.dart';
import 'package:carbook/service/fetch_service.dart';
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

  @override
  Widget build(BuildContext context) {
    Press() async {
      final fetch = FetchService();

      showLoading(context);
      Map<dynamic, dynamic> dataRequest = {"id": "Hello World"};
      await fetch.post('/testapi/testapi.php', dataRequest).then((response) {
        var res = jsonDecode(response);
        hideloading(context);
        if (response != null && res['status'] == 'success') {
          setState(() {
            apiData = TestApiModel.fromJson(res);
          });
        } else {
          showDialog(
              context: context,
              builder: ((context) => CustomAlertDialog(
                    press: () => Navigator.pop(context),
                  )));
        }
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(child: Text('Post'), onPressed: Press),
            if (apiData != null) (Text(apiData!.id!)),
          ],
        ),
      ),
    );
  }
}
