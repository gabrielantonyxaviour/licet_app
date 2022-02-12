import 'package:flutter/material.dart';

import '../../constants.dart';

class EventTile extends StatefulWidget {
  final String title;
  final String description;
  EventTile(this.title, this.description);

  @override
  _EventTileState createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 3, color: _isExpanded ? Colors.grey : Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: size.width * 0.87,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: _isExpanded
                        ? [kLHomeColor, kRHomeColor]
                        : [Colors.white, Colors.white])),
            child: ExpansionTile(
              childrenPadding: EdgeInsets.only(bottom: 8, left: 10, right: 10),
              children: [
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: _isExpanded ? Colors.white : Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: "BalooBhaijaan2"),
                )
              ],
              initiallyExpanded: _isExpanded,
              onExpansionChanged: (value) =>
                  setState(() => _isExpanded = !_isExpanded),
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        "assets/images/events.jpg",
                        height: size.height * 0.3,
                        width: size.width * 0.6,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Center(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              iconColor: Colors.transparent,
              collapsedIconColor: Colors.transparent,
              textColor: Colors.white,
              collapsedTextColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
