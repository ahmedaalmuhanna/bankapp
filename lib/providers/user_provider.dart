import 'package:bankapp/models/user.dart';
import 'package:bankapp/services/user_service.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  String token = '';
  User? user;
  void signUp(User User) async {
    token = await UserService().signup(myUser: User);
    print("token is in provider: \n $token");
  }
  // void addUser(
  //     {required String username, required String password, String? image}) {
  //   users.add(User(username: username, password: password, image: image));
  //   print(users.length);
  // }

}
