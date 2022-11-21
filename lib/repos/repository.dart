import 'dart:convert';

import 'package:bloc_simple/models/user_model.dart';
import 'package:http/http.dart';

class UserRepo {
  String endpoint = 'http://reqres.in/api/users?page=2';
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
