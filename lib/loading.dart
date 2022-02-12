import 'dart:convert';

import 'package:new_resume/screens/grades/compsemester.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class Loading extends StatefulWidget {
  final int? semester;
  Loading({this.semester});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void readJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/grades/sem1.json');
    final list = json.decode(jsonData) as List<dynamic>;
    Navigator.pushReplacementNamed(context, '/marks', arguments: [
      list.map((e) => CompSemester.fromJSON(e)).toList(),
      widget.semester
    ]);
  }

  @override
  void initState() {
    super.initState();
    readJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
