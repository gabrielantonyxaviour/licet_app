import 'package:new_resume/app_bar.dart';
import 'package:new_resume/screens/events/calendar.dart';
import 'package:new_resume/screens/grades/boxgpa.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              appBar(" Events", 30),
              SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Hero(
                  tag: 'tag-Events',
                  child: Image.asset(
                    "assets/images/events.jpg",
                    height: size.height * 0.4,
                    width: size.width * 0.8,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  boxGPA("Today", 3, size.width * 0.4, true),
                  boxGPA("This week", 5, size.width * 0.45, true)
                ],
              ),
              Calendar(controller),
            ],
          ),
        ),
      ),
    );
  }
}
