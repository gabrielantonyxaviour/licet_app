import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  // const HomeTemp({Key? key}) : super(key: key);
  //final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Lol"),
        backgroundColor: Colors.brown[500],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {},
            icon: Icon(
              Icons.person,
            ),
            label: Text("Byee"),
          )
        ],
      ),
    );
  }
}
