import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

class FetchService {
  String url = "http://localhost:8888";
  dynamic body;

  // FetchService() {
  //   // print('123');
  // }

  Future<dynamic> post(data, bodyRequest) async {
    url += data;
    body = bodyRequest;

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw HttpException('Connection Failed'); // สร้
      }
    } catch (e) {
      return null;
    }
  }
}
