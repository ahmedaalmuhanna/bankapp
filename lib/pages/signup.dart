import 'dart:io';

import 'package:bankapp/models/user.dart';
import 'package:bankapp/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File? _image;
  String myUsername = '';
  String myPassword = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _picker = ImagePicker();
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Ahmads Bank App",
        )),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 30),
              child: Text("Fill those field to Sign Up")),
          ///////////////////////////////

          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),

                  // decoration: InputDecoration(
                  //   hintText: "Username",
                  //   border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(30),
                  //       borderSide:
                  //           BorderSide(color: Color.fromARGB(135, 0, 0, 0)))
                  validator: (username) {
                    if (username!.isEmpty) {
                      return "please fill out this field";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (username) {
                    myUsername = username!;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (password) {
                    if (password!.isEmpty) {
                      return "please fill out this field";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (password) {
                    myPassword = password!;
                  },
                ),
                SizedBox(height: 30),
                ////////////////////
                ////////////////////
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        print("ontap");
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          _image = File(image!.path);
                        });
                      },
                      child: Container(
                        width: 75,
                        height: 75,
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                        ),
                        child: _image != null
                            ? Image.file(
                                _image!,
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.fitHeight,
                              )
                            : Container(
                                decoration:
                                    BoxDecoration(color: Colors.blue[200]),
                                width: 200,
                                height: 200,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey[800],
                                ),
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Image"),
                    )
                  ],
                ),
                ////////////////////
                ////////////////////
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        print(
                            "username: $myUsername\nPassword: $myPassword\nimage: ${_image?.path}");
                      }
                      Provider.of<UserProvider>(context, listen: false).signUp(
                          User(
                              username: myUsername,
                              password: myPassword,
                              image: _image?.path));
                      GoRouter.of(context).go('/');
                    },
                    child: const Text("Sign Up"),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 50),
          // Text(
          //   "Sign Up",
          //   style: TextStyle(fontSize: 25),
          // ),

          ////////////////////////////////////////////////////
          // SizedBox(height: 50),
          // Container(
          //   width: 350,
          //   child: TextField(
          //       controller: userNameController,
          // decoration: InputDecoration(
          //     hintText: "Username",
          //     border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(30),
          //         borderSide:
          //             BorderSide(color: Color.fromARGB(135, 0, 0, 0))))),
          // ),

          // SizedBox(height: 30),
          // Container(
          //   width: 350,
          //   child: TextField(
          //     controller: passWordController,
          //     decoration: InputDecoration(
          //         hintText: "Password",
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(30),
          //             borderSide: BorderSide(color: Colors.black54))),
          //   ),
          // ),
          // SizedBox(height: 20),
          // ///////////////////////////////
          // Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () async {
          //         print("ontap");
          //         final XFile? image =
          //             await _picker.pickImage(source: ImageSource.gallery);
          //         setState(() {
          //           _image = File(image!.path);
          //         });
          //       },
          //       child: Container(
          //         width: 100,
          //         height: 100,
          //         margin: const EdgeInsets.only(top: 20),
          //         decoration: BoxDecoration(
          //           color: Colors.blue[200],
          //         ),
          //         child: _image != null
          //             ? Image.file(
          //                 _image,
          //                 width: 200.0,
          //                 height: 200.0,
          //                 fit: BoxFit.fitHeight,
          //               )
          //             : Container(
          //                 decoration: BoxDecoration(color: Colors.blue[200]),
          //                 width: 200,
          //                 height: 200,
          //                 child: Icon(
          //                   Icons.camera_alt,
          //                   color: Colors.grey[800],
          //                 ),
          //               ),
          //       ),
          //     ),
          //     const Padding(
          //       padding: EdgeInsets.all(8.0),
          //       child: Text("Image"),
          //     )
          //   ],
          // ),
          // /////////////////////////////////
          // SizedBox(height: 20),
          // Container(
          //   width: 120,
          //   height: 47,
          //   child: ElevatedButton(
          //       onPressed: () {
          //         print(
          //             "username is ${userNameController.text} \n Password is ${passWordController.text}");
          //       },
          //       child: Text(
          //         "Sign Up",
          //         style: TextStyle(fontSize: 20),
          //       )),
          // ),
        ],
      ),
    );
  }
}
