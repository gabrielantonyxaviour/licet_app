import 'package:new_resume/models/user.dart';
import 'package:new_resume/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume App',
      initialRoute: '/buildyourresume',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
