import 'package:bankapp/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  List<User> users = [];
  void addUser(
      {required String username, required String password, String? image}) {
    users.add(User(username: username, password: password, image: image));
    print(users.length);
  }
}
