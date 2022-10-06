// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import 'model/user.dart';

class UserProvider extends ChangeNotifier {
  User? user;

  String get getUser => user?.title ?? '';

  saveUser(User userItem) {
    user = userItem;
    notifyListeners();
  }

  List<User> _users = [];

  List<User> get getUsers => _users;

  saveResponse(List<User> res) {
    _users = res;
    notifyListeners();
  }
}
