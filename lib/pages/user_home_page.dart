import 'package:bankapp/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.read<UserProvider>().user!;
    return Scaffold(
        backgroundColor: Color(0xFFB041014),
        bottomNavigationBar: Container(
          child: BottomAppBar(
            // color: Color(0xFFB041014),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xFFB041014),
                  Color.fromARGB(255, 3, 77, 102),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.01, 15],
              )),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFB041014), width: 1),
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 3, 121, 160),
                        boxShadow: [BoxShadow(color: Colors.black)]),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.people),
                      color: Color(0xFFB041014),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFB041014), width: 1),
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 3, 121, 160),
                        boxShadow: [BoxShadow(color: Colors.black)]),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                      color: Color(0xFFB041014),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFB041014), width: 1),
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 3, 121, 160),
                        boxShadow: [BoxShadow(color: Colors.black)]),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings),
                      color: Color(0xFFB041014),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFB041014), width: 1),
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 3, 121, 160),
                        boxShadow: [BoxShadow(color: Colors.black)]),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send),
                      color: Color(0xFFB041014),
                    ),
                  ),
                  // IconButton(onPressed: (){}), icon: icon),
                  // IconButton(onPressed: (){}), icon: icon),
                  // IconButton(onPressed: (){}), icon: icon),
                  // IconButton(onPressed: (){}), icon: icon),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(children: [
            Text("Your Name : ${context.read<UserProvider>().user!.username}",
                style: TextStyle(color: Colors.white)),
            Text("Your Balance : ${context.read<UserProvider>().user!.balance}",
                style: TextStyle(color: Colors.white)),
            Text("Your Image : ${context.read<UserProvider>().user!.image}",
                style: TextStyle(color: Colors.white)),
            if (user.image != null) Image.network(user.image ?? ""),
          ]),
        ));
  }
}

// flexibleSpace: Container(
//           //flexibleSpace: ?
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(25),
//                   bottomRight: Radius.circular(25)),
//               gradient: // gredient ?
//                   LinearGradient(colors: [
//                 Color.fromARGB(255, 255, 255, 255),
//                 Colors.blue
//               ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//         ),
