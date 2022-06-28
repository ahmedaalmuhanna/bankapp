import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _image;

  @override
  Widget build(BuildContext context) {
    var userNameController = TextEditingController();
    var passWordController = TextEditingController();

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
          // SizedBox(height: 50),
          // Text(
          //   "Sign Up",
          //   style: TextStyle(fontSize: 25),
          // ),
          SizedBox(height: 50),
          Container(
            //   width: 350,
            child: TextField(
                controller: userNameController,
                decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                        //        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(color: Color.fromARGB(135, 0, 0, 0))))),
          ),

          SizedBox(height: 30),
          Container(
            //   width: 350,
            child: TextField(
              controller: passWordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      //        borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black54))),
            ),
          ),
          SizedBox(height: 20),
          ///////////////////////////////
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  print("ontap");
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _image = File(image!.path);
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                  ),
                  child: _image != null
                      ? Image.file(
                          _image,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.fitHeight,
                        )
                      : Container(
                          decoration: BoxDecoration(color: Colors.blue[200]),
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
          /////////////////////////////////
          SizedBox(height: 20),
          Container(
            width: 120,
            height: 47,
            child: ElevatedButton(
                onPressed: () {
                  print(
                      "username is ${userNameController.text} \n Password is ${passWordController.text}");
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }
}
