class CompSemester {
  String? course;
  int? credit;
  String? grade;
  int? gradePoints;

  CompSemester({this.course, this.credit, this.grade, this.gradePoints});

  CompSemester.fromJSON(Map<String, dynamic> json) {
    course = json['course'];
    credit = json['credit'];
    grade = json['grade'];
    gradePoints = json['gradePoints'];
  }
}
