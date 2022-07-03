import 'dart:io';

import 'package:bankapp/models/user.dart';
import 'package:bankapp/providers/user_provider.dart';
import 'package:bankapp/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  EditPage({Key? key}) : super(key: key);
  File? _image;

  var userNameController = TextEditingController();
  String newUsername = '';
  var passWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var user = context.read<UserProvider>().user!;
    String text = 'Your New Usename';
    return Scaffold(
      backgroundColor: Color(0xFFB041014),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          myTextField(
              userNameController: userNameController, text: 'Your New Usename'),
          myTextField(
              userNameController: passWordController,
              text: 'Your New password'),
          ElevatedButton(
            onPressed: () async {
              print(user.username);
              print(user.password);
              var didSignUp =
                  await Provider.of<UserProvider>(context, listen: false)
                      .upDate(User(
                username: userNameController.text,
                password: passWordController.text,
              ));
              print(user.username);
              print(user.password);
              GoRouter.of(context).go('/userhomepage');
            },
            child: Text("Update"),
          )
        ]),
      ),
    );
  }
}

class myTextField extends StatelessWidget {
  const myTextField({
    Key? key,
    required this.userNameController,
    required this.text,
  }) : super(key: key);

  final TextEditingController userNameController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Container(
          width: 350,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFB041014), width: 1),
              color: Color.fromARGB(255, 3, 77, 102),
              borderRadius: BorderRadius.circular((15)),
            ),
            child: TextField(
              controller: userNameController,
              // ignore: unnecessary_new
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: text),
            ),
          )),
    );
  }
}
