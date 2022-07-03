import 'package:bankapp/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.read<UserProvider>().user!;
    var balance = TextEditingController();
    int myNewBalance = 0;
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
                    child:

                        //

                        IconButton(
                      onPressed: () {
                        GoRouter.of(context).go('/editpage');
                      },
                      icon: Icon(Icons.edit),
                      color: Color(0xFFB041014),
                    ),
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFB041014), width: 1),
                        borderRadius: BorderRadius.circular(30.0),
                        shape: BoxShape.rectangle,
                        color: Color.fromARGB(255, 3, 121, 160),
                        boxShadow: [BoxShadow(color: Colors.black)]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              myNewBalance = balance as int;
                            },
                            icon: Icon(Icons.add),
                            color: Color(0xFFB041014),
                          ),
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFFB041014), width: 5),
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 3, 121, 160),
                                boxShadow: [BoxShadow(color: Colors.black)]),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_upward),
                              color: Color(0xFFB041014),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove),
                            color: Color(0xFFB041014),
                          )
                        ]),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFB041014), width: 1),
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 3, 121, 160),
                        boxShadow: [BoxShadow(color: Colors.black)]),
                    child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).go('/transectiopage');
                      },
                      icon: Icon(Icons.history),
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
          child: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text("Your Name : ",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                    Text("${context.read<UserProvider>().user!.username}",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text("Your Balance ",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                    Text(" $myNewBalance",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text("Your Image : ",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                    Text("${context.read<UserProvider>().user!.image}",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                    if (user.image != null) Image.network(user.image ?? ""),
                  ],
                ),
              ),
              // Text("Your Deposit/withdraw: ",
              //     style: TextStyle(color: Colors.white, fontSize: 30)),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 3, 77, 102),
                  borderRadius: BorderRadius.circular((15)),
                ),
                width: 350,
                child: TextField(
                  controller: balance,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 134, 208, 233),
                          fontSize: 20),
                      hintText: "Deposit/Withdraw/Transfer: ",
                      hintMaxLines: 1,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black54))),
                ),
              ),
            ]),
          ),
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
