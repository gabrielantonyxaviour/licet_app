import 'package:new_resume/screens/home/home_settings_bottom.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'home_background.dart';

class Home extends StatelessWidget {
  InkWell homeIconWidget(
      {BuildContext? context,
      MediaQueryData? deviceData,
      String? image,
      String? text}) {
    return InkWell(
      onTap: () async {
        var navigationResult;
        if (text == "Grades")
          navigationResult = await Navigator.of(context!).pushNamed('/grades');
        else if (text == "Resume")
          navigationResult = await Navigator.of(context!).pushNamed('/resume');
        else if (text == "Events")
          navigationResult = await Navigator.of(context!).pushNamed('/events');
        else if (text == "Reservations")
          navigationResult =
              await Navigator.of(context!).pushNamed('/reservations');
        else
          navigationResult = false;
        if (navigationResult == false)
          showDialog(
              context: context!,
              builder: (context) => AlertDialog(
                    title: Text('Failed'),
                  ));
      },
      child: Card(
        shadowColor: Colors.black,
        elevation: 15,
        //margin: EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Column(
          children: [
            Hero(
              tag: 'tag-$text',
              child: Image.asset(image!,
                  height: deviceData!.size.height * 0.2,
                  width: deviceData.size.width * 0.4,
                  fit: BoxFit.fitHeight),
            ),
            SizedBox(
              height: deviceData.size.height * 0.01,
            ),
            Text(
              text!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: deviceData.size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        BackGround(deviceData.size, kLHomeColor, kRHomeColor),
        Positioned(
            left: deviceData.size.width * 0.3,
            top: deviceData.size.width * 0.17,
            child: Text(
              "ECE APP",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Cairo'),
            )),
        Positioned(
          left: -deviceData.size.width * 0.02,
          top: deviceData.size.height * 0.08,
          child: Container(
            height: deviceData.size.height * 0.15,
            width: deviceData.size.width * 0.27,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(35)),
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/logo.png"),
                )),
          ),
        ),
        Positioned(
          top: deviceData.size.height * 0.28,
          height: deviceData.size.height,
          width: deviceData.size.width,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 15,
            runSpacing: 20,
            children: [
              homeIconWidget(
                  context: context,
                  deviceData: deviceData,
                  image: "assets/images/grades.jpg",
                  text: "Grades"),
              homeIconWidget(
                  context: context,
                  deviceData: deviceData,
                  image: "assets/images/resume.jpg",
                  text: "Resume"),
              homeIconWidget(
                  context: context,
                  deviceData: deviceData,
                  image: "assets/images/events.jpg",
                  text: "Events"),
              homeIconWidget(
                  context: context,
                  deviceData: deviceData,
                  image: "assets/images/goals.jpg",
                  text: "Reservations")
            ],
          ),
        ),
        HomeBottomNavigator(
          deviceData: deviceData,
          homeFlag: true,
        )
      ],
    ));
  }
}
