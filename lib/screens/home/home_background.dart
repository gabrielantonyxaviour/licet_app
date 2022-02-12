import 'package:flutter/material.dart';

import '../../constants.dart';

class BackGround extends StatelessWidget {
  final size;
  final Color left;
  final Color right;
  BackGround(this.size, this.left, this.right);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.45,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [left, right]),
      ),
    );
  }
}
