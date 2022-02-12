import 'package:new_resume/loading.dart';
import 'package:new_resume/screens/resume/resume.dart';
import 'package:new_resume/screens/events/events.dart';
import 'package:new_resume/screens/reservations/reservations.dart';
import 'package:new_resume/screens/grades/grades.dart';
import 'package:new_resume/screens/grades/marks.dart';
import 'package:new_resume/screens/grades/more_info.dart';
import 'package:new_resume/screens/home/settings.dart';
import 'package:flutter/material.dart';

import 'screens/home/home.dart';
import 'screens/resume/buildresume.dart';
import 'screens/resume/downloadresume.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/buildyourresume':
        return MaterialPageRoute(builder: (_) => BuildResume());
      case '/downloadresume':
        return MaterialPageRoute(builder: (_) => DownloadResume());
      case '/setting':
        return MaterialPageRoute(builder: (_) => Settings());
      case '/resume':
        return MaterialPageRoute(builder: (_) => Resume());
      case '/reservations':
        return MaterialPageRoute(builder: (_) => Reservations());
      case '/grades':
        return MaterialPageRoute(builder: (_) => Grades());
      case '/events':
        return MaterialPageRoute(builder: (_) => Events());
      case '/more_info':
        return MaterialPageRoute(builder: (_) => MoreInfo());
      case '/loading':
        return MaterialPageRoute(builder: (_) => Loading());
      case '/marks':
        if (args is List) {
          return MaterialPageRoute(
              builder: (_) => Marks(args.elementAt(0), args.elementAt(1)));
        }
    }
  }
}
