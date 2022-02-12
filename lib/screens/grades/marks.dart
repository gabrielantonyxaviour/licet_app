import 'dart:convert';

import 'package:new_resume/app_bar.dart';
import 'package:new_resume/constants.dart';
import 'package:new_resume/screens/events/calendar.dart';
import 'package:new_resume/screens/grades/boxgpa.dart';
import 'package:new_resume/screens/home/home_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'completedsem_row.dart';
import 'grades.dart';

import 'compsemester.dart';
import 'package:flutter/services.dart' as rootBundle;

class Marks extends StatefulWidget {
  final int semester;
  final int current;
  Marks(this.semester, this.current);

  @override
  _MarksState createState() => _MarksState();
}

class _MarksState extends State<Marks> {
  /* final List<Map> marks = [
    {'course': 'Engineering Mathematics - I', 'grade': 'O', 'credit': 4},
    {'course': 'Communicative English', 'grade': 'A+', 'credit': 4},
    {'course': 'Engineering Physics', 'grade': 'B+', 'credit': 3},
    {'course': 'Engineering Chemistry', 'grade': 'O', 'credit': 3},
    {'course': 'Engineering Graphics', 'grade': 'A', 'credit': 4},
    {
      'course': 'Problem Solving and Python Programming',
      'grade': 'A',
      'credit': 3
    },
    {
      'course': 'Problem Solving and Python Programming Laboratory',
      'grade': 'O',
      'credit': 2
    },
    {'course': 'Physics and Chemistry Laboratory', 'grade': 'O', 'credit': 2},
  ]; */
  final List<Map> marks = [
    {
      'course': 'Engineering Mathematics - I',
      'grade': 'O',
      'internals': [9, 9, 9]
    },
    {
      'course': 'Communicative English',
      'grade': 'A+',
      'internals': [2, 3, 10]
    },
    {
      'course': 'Engineering Physics',
      'grade': 'B+',
      'internals': [2, 3]
    },
    {
      'course': 'Engineering Chemistry',
      'grade': 'O',
      'internals': [8, 7, 9]
    },
    {
      'course': 'Engineering Graphics',
      'grade': 'A',
      'internals': [8, 7, 6]
    },
    {
      'course': 'Problem Solving and Python Programming',
      'grade': 'A',
      'internals': [10, 10, 9]
    },
    {
      'course': 'Problem Solving and Python Programming Laboratory',
      'grade': 'O',
      'internals': []
    },
    {
      'course': 'Physics and Chemistry Laboratory',
      'grade': 'O',
      'internals': []
    },
  ];
  final double gpa = 8.82;
  bool colorSwap = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            appBar("Semester ${widget.current}", 25),
            widget.semester != widget.current
                ? Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Center(child: boxGPA("GPA", gpa, size.width * 0.3)),
                  )
                : SizedBox(
                    height: 30,
                  ),
            Center(
              child: Text(
                widget.semester != widget.current ? "Results" : "Internals",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontFamily: "BalooBhaijaan2",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 10, spreadRadius: 1, color: Colors.grey)
              ]),
              child: Column(
                children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.grey[200],
                                child: Text(
                                  "Course",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "BalooBhaijaan2",
                                  ),
                                ),
                              ),
                            ),
                            widget.semester != widget.current
                                ? Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: Colors.grey[200],
                                      child: Text("Grade\t\t ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "BalooBhaijaan2",
                                          )),
                                    ),
                                  )
                                : Text('')
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                    ] +
                    marks
                        .map((e) => RowEntry(
                            e['course'],
                            widget.semester != widget.current
                                ? [e['grade'], e['credit']]
                                : e['internals']))
                        .toList(),
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      )),
    );
  }
}
