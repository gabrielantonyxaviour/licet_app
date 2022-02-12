import 'package:flutter/material.dart';

import '../../constants.dart';

class MoreInfo extends StatelessWidget{

  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
              body: Column(
                children: [
                  Row(children:[Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(icon: Icon(Icons.arrow_back_outlined),color: Colors.black,iconSize: 30,onPressed: (){Navigator.of(context).pop();},),
                  ),]),
                  SizedBox(height: 30,),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //border: Border.all(color: Colors.black,width: 3),
                        gradient: LinearGradient(colors: [kLHomeColor,kRHomeColor]),
                        boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 15,spreadRadius: 5),],
                      ),
                      child: RichText(text: TextSpan(children: [TextSpan(
                          text: " \u{1F4DD}  Info ",
                          style: TextStyle(fontSize: 25,fontFamily: "BalooBhaijaan2",color: Colors.white,fontWeight: FontWeight.bold)
                      ),
                        TextSpan(
                            text: "\n• All the ",
                            style: TextStyle(fontSize: 20,fontFamily: "BalooBhaijaan2",color: Colors.white,fontWeight: FontWeight.w600)
                        ),
                        TextSpan(
                            text: "grades ",
                            style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "BalooBhaijaan2",fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)
                        ),
                        TextSpan(
                            text: "from first semester are available in this page. \n• ",
                            style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600,fontFamily: "BalooBhaijaan2",)
                        ),
                        TextSpan(
                            text: "Turn on notifications",
                            style: TextStyle(fontSize: 20,color: Colors.yellow,fontWeight: FontWeight.w600,fontFamily: "BalooBhaijaan2",decoration: TextDecoration.underline  )
                        ),
                        TextSpan(
                            text: " \u{1F514} to get notified when your marks are updated.\n",
                            style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "BalooBhaijaan2",fontWeight: FontWeight.w600)
                        ),
                        TextSpan(
                            text: "• Click on the ",
                            style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "BalooBhaijaan2",fontWeight: FontWeight.w600)
                        ),
                        TextSpan(
                            text: "current ",
                            style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold,fontFamily: "BalooBhaijaan2",fontStyle: FontStyle.italic)
                        ),
                        TextSpan(
                            text: "semester to view the marks awarded for the internal uploads.\n",
                            style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "BalooBhaijaan2",fontWeight: FontWeight.w600)
                        ),
                        TextSpan(
                            text: "• Click on the ",
                            style: TextStyle(fontSize: 20,fontFamily: "BalooBhaijaan2",color: Colors.white,fontWeight: FontWeight.w600)
                        ),TextSpan(
                            text: "previous ",
                            style: TextStyle(fontSize: 20,color: Colors.blue,fontFamily: "BalooBhaijaan2",fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)
                        ),TextSpan(
                            text: "semesters to view the final grades obtained for the semester.",
                            style: TextStyle(fontSize: 20,fontFamily: "BalooBhaijaan2",color: Colors.white,fontWeight: FontWeight.w600)
                        ),


                      ]),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

}