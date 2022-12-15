import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchPassenger {
  void Profile() async {
    var apiUrl = 'https://randomuser.me/api/?results=10';
    var result = await http.get(Uri.parse(apiUrl));
    print(jsonDecode(result.body)['results']);
    return jsonDecode(result.body)['results'];
  }
}
