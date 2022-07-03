import 'package:bankapp/models/trans_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TransList myList;
    String out = 'sent';
    String to = 'To';
    int a = 255;
    int b = 36;
    int c = 255;
    int d = 7;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 77, 102),
        title: Center(
            child: Text(
          "Ahmads Bank",
        )),
      ),
      backgroundColor: Color(0xFFB041014),
      body: ListView.builder(
        itemCount: transList.length,
        itemBuilder: (context, index) {
          // if (transList[index].out != true) {
          //   out = 'Received';
          //   to = 'from';
          // }

          return Card(
              color: Color.fromARGB(250, 10, 74, 95),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    child: Column(
                      children: [
                        Text(
                          "${transList[index].name}",
                          style: TextStyle(
                              color: Color.fromARGB(144, 255, 255, 255),
                              fontSize: 28),
                        ),
                        Text(
                          "Amount: ${transList[index].amount}",
                          style: TextStyle(
                              color: Color.fromARGB(144, 255, 255, 255),
                              fontSize: 28),
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
