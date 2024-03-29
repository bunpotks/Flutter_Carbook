import 'package:carbook/service/alert_dialog.dart';
import 'package:carbook/service/fetch_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class TestApiModel {
  String? id;
  String? data;
  String? desc;
  TestApiModel({
    this.id,
    this.data,
    this.desc,
  });

  TestApiModel.fromJson(Map<String, dynamic> json) {
    // print(json);
    id = json['id'];
    data = json['data'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['data'] = data;
    _data['desc'] = desc;
    return _data;
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
        hideloading(context);
        try {
          var res = jsonDecode(response);
          if (response != null && res['status'] == 'success') {
            setState(() {
              apiData = TestApiModel.fromJson(res);
            });
          } else {
            showDialog(
                context: context,
                builder: ((context) => CustomConfirmDialog(
                      title: "hello",
                      desc: 'ไม่พบข้อมูลโปรดลองใหม่อีกครั้ง',
                      press: () => Navigator.pop(context),
                    )));
          }
        } catch (e) {
          showDialog(
              context: context,
              builder: ((context) => CustomConfirmDialog(
                    title: "hello",
                    desc:
                        'ไม่พบข้อมูลโปรดลองใหม่อีกครั้ง ไม่พบข้อมูลโปรดลองใหม่อีกครั้ง',
                    press: () => Navigator.pop(context),
                  )));
        }
      });
    }

    Press2() {
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(
                press: () => Navigator.pop(context),
              ));
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(child: Text('Post'), onPressed: Press),
            ElevatedButton(child: Text('Post'), onPressed: Press2),
            if (apiData != null) (Text(apiData!.id.toString())),
          ],
        ),
      ),
    );
  }
}
