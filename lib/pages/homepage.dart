import 'package:bankapp/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userNameController = TextEditingController();
    var passWordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "CODED Bank App",
        )),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: 350,
              child: TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Color.fromARGB(135, 0, 0, 0))))),
            ),
            SizedBox(height: 30),
            Container(
              width: 350,
              child: TextField(
                controller: passWordController,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.black54))),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(),
              width: 100,
              height: 47,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(height: 50),
            Container(
              child: InkWell(
                onTap: () {},
                child: Text(
                  "Forget Password?",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: InkWell(
                onTap: () {
                  if (UserProvider().IsAuth == false) {
                    context.push('/signup');
                  } else {
                    print('object');
                  }
                },
                child: Text(
                  "Sign Up!",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
