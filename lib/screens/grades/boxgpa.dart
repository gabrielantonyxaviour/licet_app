import 'package:new_resume/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class boxGPA extends StatelessWidget {
  final String top;
  final double value;
  final double size;
  final bool toInt;
  boxGPA(this.top, this.value, this.size, [this.toInt = false]);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: size,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            border: Border.all(color: Colors.black, width: 0.2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 7,
                spreadRadius: 1,
              )
            ],
          ),
          child: Center(
            child: Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.grey[700]!,
              child: Text(
                top,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Cairo"),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: size,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 7,
                  spreadRadius: 1,
                )
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(colors: [kLHomeColor, kRHomeColor])),
          child: Center(
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey[300]!,
              child: Text(
                toInt ? "${value.toInt()}" : "$value",
                style: TextStyle(
                    //  color: Colors.white,
                    fontSize: 30,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        )
      ],
    );
  }
}
