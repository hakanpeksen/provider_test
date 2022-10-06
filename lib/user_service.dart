import 'dart:io';

import 'package:dio/dio.dart';

import 'model/user.dart';

class UserService {
  final Dio dio;

  UserService(this.dio);

  final _userPath = "https://jsonplaceholder.typicode.com/posts";

  Future<List<User>?> fetchUser() async {
    try {
      final response = await dio.get(_userPath);
      if (response.statusCode == 200) {
        final responses = response.data;
        if (responses is List) {
          return responses.map((e) => User.fromJson(e)).toList();
        }
      }
      return null;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        print("No Internet Connection!");
      }
      if (e.response?.statusCode == 404) {
        print(e.response?.statusCode);
      }
    }
    return null;
  }
}
