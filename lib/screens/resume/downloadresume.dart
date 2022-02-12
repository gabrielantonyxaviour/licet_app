import 'package:new_resume/app_bar.dart';
import 'package:flutter/material.dart';

class DownloadResume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [appBar("\tDownload Resume", 25)],
        ),
      ),
    );
  }
}
