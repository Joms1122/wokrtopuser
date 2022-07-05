import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:worktopuser/api/api.dart';
import 'package:worktopuser/view/home/home.dart';
import 'package:flutter/material.dart';

class LoginController {
  Future getToken(String username, String password) async {
    final response = await http.post(
      Uri.parse(ApiCon.baseurl + '/auth/admin/token/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: jsonEncode({
        'userName': username,
        'password': password,
      }),
    );
  }

  // if (response.statusCode == 201) {
  //   // If the server did return a 201 CREATED response,
  //   // then parse the JSON.

  //   print('success!');
  //   // return jsonDecode(response.body);
  //   return const Home();
  // } else {
  //   // If the server did not return a 201 CREATED response,
  //   // then throw an exception.
  //   print('Failed to access!');
  //   throw Exception('Failed to access.');
  // }
}

  // Future<http.Response> getToken(String username, String password) {
  //   return http.post(
  //     Uri.parse(ApiCon.baseurl + '/api/auth/admin/token'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'userame': username,
  //       'password': password,
  //     }),
  //   );


