import 'package:new_resume/constants.dart';
import 'package:new_resume/screens/home/home.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigator extends StatelessWidget {
  final deviceData;
  final bool? homeFlag;

  HomeBottomNavigator({this.deviceData, this.homeFlag});

  final List<Map<String, dynamic>> _design = [
    {
      'icon_color': Colors.white,
      'bg_color': [kLHomeColor, kRHomeColor],
    },
    {
      'icon_color': Colors.black,
      'bg_color': [Colors.white, Colors.white],
    }
  ];

  Container bottomIcon(
      {List<Color>? bgColor,
      Color? iconColor,
      bool? leftOrRight,
      BuildContext? context}) {
    return Container(
      width: deviceData.size.width * 0.27,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: bgColor!),
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 10)
          ],
          borderRadius: BorderRadius.only(
            topRight: leftOrRight! ? Radius.zero : Radius.circular(40),
            topLeft: leftOrRight ? Radius.circular(40) : Radius.zero,
          )),
      child: IconButton(
        icon: Icon(
          leftOrRight ? Icons.home : Icons.settings,
          color: iconColor,
          size: 40,
        ),
        onPressed: () async {
          var navigationResult;
          if (homeFlag == true) {
            if (leftOrRight == false)
              navigationResult =
                  await Navigator.of(context!).pushReplacementNamed('/setting');
          } else {
            if (leftOrRight == true)
              navigationResult =
                  await Navigator.of(context!).pushReplacementNamed('/');
          }
          if (navigationResult == false)
            showDialog(
                context: context!,
                builder: (context) => AlertDialog(
                      title: Text('Failed'),
                    ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
        bottom: 0,
        left: deviceData.size.width * 0.23,
        height: deviceData.size.height * 0.08,
        width: deviceData.size.width * 0.54,
        child: Row(
          textDirection: TextDirection.ltr,
          children: [
            bottomIcon(
                bgColor: _design[homeFlag! ? 0 : 1]['bg_color']!,
                iconColor: _design[homeFlag! ? 0 : 1]['icon_color'],
                leftOrRight: true,
                context: context),
            bottomIcon(
                bgColor: _design[homeFlag! ? 1 : 0]['bg_color'],
                iconColor: _design[homeFlag! ? 1 : 0]['icon_color'],
                leftOrRight: false,
                context: context),
          ],
        ));
  }
}
