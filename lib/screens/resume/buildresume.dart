import 'package:new_resume/app_bar.dart';
import 'package:new_resume/constants.dart';
import 'package:flutter/material.dart';

class BuildResume extends StatefulWidget {
  @override
  State<BuildResume> createState() => _BuildResumeState();
}

class _BuildResumeState extends State<BuildResume> {
  Map personal = {
    'First name': '',
    'Last name': '',
    'Date of Birth': '',
    'Gender': '',
    'Languages known': '',
    'Nationality': '',
    'Address Line 1': '',
    'Address Line 2': '',
    'City': '',
    'Zip code': '',
    'Martial Status': '',
    'Email': '',
    'Phone': '',
    'Linkedin': '',
    'Portfolio website': '',
  };

  Map professional = {
    'Objective': '',
    'Work Experience': '',
    'Internships': '',
    'Education and Qualifications': '',
    'Hobbies': '',
    'Soft Skills': '',
    'Technical Skills': '',
    'Courses Completed': '',
    'Achievements': '',
    'Publications': ''
  };
  DateTime _date = DateTime.now();
  Widget entryField({Size? size, String? title, String? type}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(title!,
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontFamily: "BalooBhaijaan2",
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          ['First Name', 'Last Name', 'Address Line 1', 'Address Line 2']
                  .contains(title)
              ? textField(title)
              : textField(title),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  TextField textField(String title) {
    return TextField(
      style: TextStyle(
          color: Colors.orange[700],
          fontWeight: FontWeight.w700,
          fontSize: 20,
          fontFamily: 'Cairo'),
      keyboardType: title == "Zip code" || title == "Phone"
          ? TextInputType.numberWithOptions(decimal: false, signed: true)
          : title == "Date of Birth"
              ? TextInputType.datetime
              : TextInputType.name,
      cursorColor: kRHomeColor,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          hintText: title == "Date of Birth" ? 'DD/MM/YYYY' : '',
          hintStyle: TextStyle(color: Colors.grey[400]),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(color: Colors.grey[700]!, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(color: kLHomeColor, width: 2))),
      onChanged: (value) {
        setState(() {
          personal[title] = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: Column(
              children: [
                appBar("\tBuild Resume", 25),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpg"),
                      ),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Container(
                                height: 180,
                                width: 400,
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            icon: Container(
                                                child: Icon(
                                              Icons.close,
                                              size: 18,
                                            ))),
                                        Padding(
                                          child: Text(
                                            "Profile",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Cairo",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          padding: EdgeInsets.only(left: 80),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(0.0),
                                            elevation: 5,
                                          ),
                                          onPressed: () {},
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                kLHomeColor,
                                                kRHomeColor
                                              ]),
                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.picture_as_pdf),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text('Choose from gallery',
                                                    textAlign:
                                                        TextAlign.center),
                                              ],
                                            ),
                                          ),
                                        )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                            child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(0.0),
                                            elevation: 5,
                                          ),
                                          onPressed: () {},
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                kLHomeColor,
                                                kRHomeColor
                                              ]),
                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.camera),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text('Take a photo',
                                                    textAlign:
                                                        TextAlign.center),
                                              ],
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ...personal.entries.map((entry) {
                  return entryField(
                      size: size, title: entry.key, type: "Personal");
                }).toList(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    "Professional Information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ...professional.entries.map((entry) {
                  return entryField(
                      size: size, title: entry.key, type: "Professional");
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
