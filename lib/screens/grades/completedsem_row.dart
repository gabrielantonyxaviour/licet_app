import 'package:new_resume/constants.dart';
import 'package:flutter/material.dart';

class RowEntry extends StatefulWidget {
  final String course;
  final List data;
  RowEntry(this.course, this.data);

  @override
  _RowEntryState createState() => _RowEntryState();
}

class _RowEntryState extends State<RowEntry> {
  bool _isExpanded = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      double minScrollextent = _scrollController.position.minScrollExtent;
      double maxScrollextent = _scrollController.position.maxScrollExtent;

      if (maxScrollextent != 0.0)
        animateToMaxMin(maxScrollextent, minScrollextent, maxScrollextent, 4,
            _scrollController);
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: max ~/ 8), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  void expandTile() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 3, color: _isExpanded ? Colors.white : Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: _isExpanded
                      ? [kLHomeColor, kRHomeColor]
                      : [Colors.white, Colors.white])),
          child: ExpansionTile(
            childrenPadding: EdgeInsets.only(bottom: 5),
            children: [
              widget.data.length != 0
                  ? widget.data[0].runtimeType != int
                      ? Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text("Credit:\t\t\t${widget.data[1]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "BalooBhaijaan2",
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                  "GP:\t\t\t${gradeTogradePoints[widget.data[0]]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "BalooBhaijaan2",
                                  )),
                            ),
                          ],
                        )
                      : Column(children: [
                          for (int i = 0; i < widget.data.length; i++)
                            Text(
                                "Internal ${i + 1}:  \t\t\t${widget.data[i]}/10",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "BalooBhaijaan2",
                                ))
                        ])
                  : Text("No Uploads Yet",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "BalooBhaijaan2",
                      ))
            ],
            initiallyExpanded: _isExpanded,
            onExpansionChanged: (value) {
              expandTile();
            },
            title: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    child: Text(widget.course,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: "BalooBhaijaan2",
                        )),
                  ),
                ),
                widget.data.length != 0 && widget.data[0].runtimeType != int
                    ? Expanded(
                        child: Text(
                            widget.data[0].length != 1
                                ? widget.data[0]
                                : widget.data[0] + '\t',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: "BalooBhaijaan2",
                            )))
                    : Text('')
              ],
            ),
            textColor: Colors.white,
            iconColor:
                widget.data.length == 0 || widget.data[0].runtimeType == int
                    ? Colors.white
                    : Colors.transparent,
            collapsedBackgroundColor: Colors.white,
            collapsedIconColor:
                widget.data.length == 0 || widget.data[0].runtimeType == int
                    ? Colors.black
                    : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
