import 'package:bankapp/pages/editpage.dart';
import 'package:bankapp/pages/homepage.dart';
import 'package:bankapp/pages/signup.dart';
import 'package:bankapp/pages/transectionpage.dart';
import 'package:bankapp/pages/user_home_page.dart';

import 'package:bankapp/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import 'package:jwt_decode/jwt_decode.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}

final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => SignUp(),
  ),
  GoRoute(
    path: '/userhomepage',
    builder: (context, state) => UserHomePage(),
  ),
  GoRoute(
    path: '/editpage',
    builder: (context, state) => EditPage(),
  ),
  GoRoute(path: '/transectiopage', builder: (context, state) => TranPage()),
]);

      //   drawer: Drawer(
      //     child: ListView(
      //       children: [
      //         ListTile(
      //           title: Text("Sign up"),
      //           trailing: Icon(Icons.login),
      //           onTap: () {
      //             // Signing up
      //           },
      //         ),
      //         ListTile(
      //           title: Text("Sign in"),
      //           trailing: Icon(Icons.how_to_reg),
      //           onTap: () {
      //             // Signing up
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      //   appBar: AppBar(title: Text("Bank App")),