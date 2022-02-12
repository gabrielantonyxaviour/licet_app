import 'package:new_resume/constants.dart';
import 'package:new_resume/screens/home/home_settings_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
//  final AuthService _auth = AuthService();
  Padding listElement(
      {@required IconData? leading,
      @required String? title,
      String? subtitle,
      IconData? trailing}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: ListTile(
        onTap: () async {
          //     await _auth.signOut();
        },
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          child: Icon(leading),
        ),
        title: Text(" $title",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: "Cairo")),
        trailing: Icon(
          trailing,
          color: Colors.white,
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                " $subtitle",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w700),
              ),
      ),
    );
  }

  Padding heading({@required String? name}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: Row(
        children: [
          Text("$name",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Cairo"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: deviceData.size.height,
        width: deviceData.size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [kLHomeColor, kRHomeColor]),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Icon(
                      Icons.settings_sharp,
                      color: Colors.white,
                    ),
                    Text("  Settings",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Cairo"))
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Divider(
                    color: Colors.white,
                    thickness: 1.2,
                  ),
                ),
                heading(name: "GENERAL"),
                listElement(
                    leading: Icons.person,
                    title: "Change NickName",
                    trailing: Icons.arrow_forward),
                listElement(
                    leading: Icons.lock_outline_sharp,
                    title: "Change Password",
                    trailing: Icons.arrow_forward),
                listElement(
                    leading: Icons.message,
                    title: "Notifications",
                    subtitle: "OFF",
                    trailing: Icons.adjust_outlined),
                listElement(leading: Icons.logout_sharp, title: "Log Out"),
                heading(name: "FEEDBACK"),
                listElement(
                    leading: Icons.announcement,
                    title: "Report Issue",
                    trailing: Icons.arrow_forward),
                listElement(
                    leading: Icons.wb_incandescent,
                    title: "Suggestions",
                    trailing: Icons.arrow_forward)
              ],
            ),
            HomeBottomNavigator(
              deviceData: deviceData,
              homeFlag: false,
            ),
          ],
        ),
      )),
    );
  }
}
