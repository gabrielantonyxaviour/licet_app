import 'package:new_resume/app_bar.dart';
import 'package:flutter/material.dart';

class Reservations extends StatefulWidget {
  @override
  _ReservationsState createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      appBar("Reservations", 25),
      SizedBox(
        height: 30,
      ),
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Hero(
          tag: 'tag-Goals',
          child: Image.asset(
            "assets/images/goals.jpg",
            height: size.height * 0.4,
            width: size.width * 0.8,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    ])));
  }
}
