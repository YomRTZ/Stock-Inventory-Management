import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stock_inventory_management/src/common/constant_url.dart';
import 'package:stock_inventory_management/src/data/model/user_model.dart';

class UserProvider {
  String url = "${AppUrl.baseUrl}suppliers";
  Future<List<Datum>> fetchUser() async {
    try {
      final response = await http.get(Uri.parse(url));
      print("url:$url");
      print("Raw response: ${response.body}");

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        List<dynamic> userList = jsonResponse['data'];
        print("data:$userList");
        print("statusCode:${response.statusCode}");

        return userList.map((data) => Datum.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error, stacktrace) {
      print("Exception: $error");
      print("Stack trace: $stacktrace");
      rethrow;
    }
  }

  // create
  Future<void> addUser(Datum user) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to add user: ${response.body}");
    }
  }

}
