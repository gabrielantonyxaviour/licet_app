import 'package:new_resume/app_bar.dart';
import 'package:new_resume/screens/grades/boxgpa.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_resume/constants.dart';

class Grades extends StatefulWidget {
  final int semester = 3;
  @override
  _GradesState createState() => _GradesState();
}

class _GradesState extends State<Grades> {
  bool moreInfo = false;

  Widget circularAvatar(int pos, BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: pos > widget.semester
          ? null
          : () async {
              var navigationResult;
              navigationResult = await Navigator.of(context)
                  .pushNamed('/marks', arguments: [widget.semester, pos]);
              if (navigationResult == false)
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Failed'),
                        ));
            },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size.height * 0.102,
            width: size.height * 0.102,
            decoration: BoxDecoration(
                color: pos > widget.semester
                    ? Colors.blueGrey
                    : pos == widget.semester
                        ? Colors.grey
                        : Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Container(
            height: size.height * 0.09,
            width: size.height * 0.09,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: pos <= widget.semester
                        ? pos == widget.semester
                            ? [kLHomeColor, kRHomeColor]
                            : [Colors.white, Colors.white]
                        : [Colors.white, Colors.grey]),
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          pos > widget.semester
              ? Icon(
                  Icons.lock,
                  color: Colors.blueGrey,
                  size: 30,
                )
              : Text(
                  numberToRoman[pos],
                  style: TextStyle(
                      color:
                          pos == widget.semester ? Colors.white : Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.w700),
                )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              appBar("Grades", 30),
              SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Hero(
                  tag: 'tag-Grades',
                  child: Image.asset(
                    "assets/images/grades.jpg",
                    height: size.height * 0.4,
                    width: size.width * 0.8,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              boxGPA("CGPA", 9.5, size.width * 0.4),
              SizedBox(
                height: 10,
              ),
              Container(
                width: size.width * 0.85,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Choose Semester",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Cairo"),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 20,
                            runSpacing: 15,
                            children: [
                              for (int i = 1; i <= 8; i++)
                                circularAvatar(i, context)
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "More info",
                      style: TextStyle(
                          fontSize: 20,
                          color: moreInfo == false ? Colors.black : Colors.red,
                          fontWeight: FontWeight.w600,
                          fontFamily: "BalooBhaijaan2",
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            moreInfo = !moreInfo;
                          });
                          //Navigator.of(context).pushNamed('/more_info');
                        },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              moreInfo == true
                  ? Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          //border: Border.all(color: Colors.black,width: 3),
                          gradient: LinearGradient(
                              colors: [kLHomeColor, kRHomeColor]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15,
                                spreadRadius: 5),
                          ],
                        ),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: " \u{1F4DD}  Info ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "BalooBhaijaan2",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "\n• All the ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "BalooBhaijaan2",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            TextSpan(
                                text: "grades ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: "BalooBhaijaan2",
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic)),
                            TextSpan(
                                text:
                                    "from first semester are available in this page. \n• ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "BalooBhaijaan2",
                                )),
                            TextSpan(
                                text: "Turn on notifications",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "BalooBhaijaan2",
                                    decoration: TextDecoration.underline)),
                            TextSpan(
                                text:
                                    " \u{1F514} to get notified when your marks are updated.\n",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: "BalooBhaijaan2",
                                    fontWeight: FontWeight.w600)),
                            TextSpan(
                                text: "• Click on the ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: "BalooBhaijaan2",
                                    fontWeight: FontWeight.w600)),
                            TextSpan(
                                text: "current ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "BalooBhaijaan2",
                                    fontStyle: FontStyle.italic)),
                            TextSpan(
                                text:
                                    "semester to view the marks awarded for the internal uploads.\n",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: "BalooBhaijaan2",
                                    fontWeight: FontWeight.w600)),
                            TextSpan(
                                text: "• Click on the ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "BalooBhaijaan2",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            TextSpan(
                                text: "previous ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontFamily: "BalooBhaijaan2",
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic)),
                            TextSpan(
                                text:
                                    "semesters to view the final grades obtained for the semester.",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "BalooBhaijaan2",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ]),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 10,
                    ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
