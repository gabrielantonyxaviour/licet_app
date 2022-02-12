import 'package:new_resume/app_bar.dart';
import 'package:new_resume/constants.dart';
import 'package:flutter/material.dart';

class Resume extends StatelessWidget {
  InkWell resumeMenuCard(
      {String? title, String? content, String? image, BuildContext? context}) {
    var size = MediaQuery.of(context!).size;
    return InkWell(
      onTap: () async {
        var navigationResult;

        if (title == "Build Your Resume")
          navigationResult =
              await Navigator.of(context).pushNamed('/buildyourresume');
        else
          navigationResult =
              await Navigator.of(context).pushNamed('/downloadresume');
        return navigationResult;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Container(
            width: size.width * 0.4,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(
                    image!,
                    height: size.height * 0.2,
                    width: size.width * 0.5,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Text(title!,
                    style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        gradient:
                            LinearGradient(colors: [kLHomeColor, kRHomeColor])),
                    child: Text(
                      content!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1)
                ] //border: Border.all(color: Colors.black, width: 2)
                )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            appBar("Resume", 25),
            SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Hero(
                tag: 'tag-Resume',
                child: Image.asset(
                  "assets/images/resume.jpg",
                  height: size.height * 0.4,
                  width: size.width * 0.8,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  resumeMenuCard(
                      title: "Build Your Resume",
                      image: "assets/images/build.jpg",
                      context: context,
                      content:
                          "Start making your resume from scratch or edit your current resume"),
                  resumeMenuCard(
                      title: "Download Resume",
                      image: "assets/images/download.jpg",
                      context: context,
                      content:
                          "View your resume in different templates and download in pdf"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
