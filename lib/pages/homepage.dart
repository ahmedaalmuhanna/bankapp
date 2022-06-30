import 'package:bankapp/models/user.dart';
import 'package:bankapp/providers/user_provider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userNameController = TextEditingController();
    var passWordController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFB041014),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 77, 102),
        title: Center(
            child: Text(
          "Ahmads Bank App",
        )),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: 350,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 3, 77, 102),
                  borderRadius: BorderRadius.circular((15)),
                ),
                child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 134, 208, 233),
                            fontSize: 20),
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Color.fromARGB(135, 0, 0, 0))))),
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 77, 102),
                borderRadius: BorderRadius.circular((15)),
              ),
              width: 350,
              child: TextField(
                controller: passWordController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 134, 208, 233),
                        fontSize: 20),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black54))),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(),
              width: 100,
              height: 47,
              child: ElevatedButton(
                  onPressed: () async {
                    var didlogin = await context.read<UserProvider>().signIn(
                        User(
                            username: userNameController.text,
                            password: passWordController.text));
                    print(didlogin);
                    if (didlogin) {
                      context.push('/userhomepage');
                    } else {
                      print('object');
                    }
                  },
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
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 77, 102), fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: InkWell(
                onTap: () {
                  context.push('/signup');
                },
                child: Text(
                  "Sign Up!",
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 77, 102), fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
