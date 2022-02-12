import 'package:new_resume/constants.dart';
import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  final String text;
  final double fontsize;
  appBar(this.text, this.fontsize);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.085,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 15, spreadRadius: 5)
            ],
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: fontsize,
                fontWeight: FontWeight.w700,
                fontFamily: "Cairo",
              ),
            ),
          ),
        ),
        Container(
          height: size.height * 0.085,
          width: size.height * 0.085,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [kLHomeColor, kRHomeColor]),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(20)),
          ),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
