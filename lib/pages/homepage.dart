import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "CODED Bank App",
        )),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          TextField(
            decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54))),
          ),
          SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54))),
          ),
          SizedBox(height: 20),
          Container(
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
                context.push('/signup');
              },
              child: Text(
                "Sign Up!",
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
