import 'dart:collection';

import 'package:new_resume/screens/events/event_tile.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constants.dart';
import 'calendar_event.dart';

class Calendar extends StatefulWidget {
  final ScrollController controller;
  Calendar(this.controller);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDay = DateTime.now();

  Map<DateTime, List<Event>>? selectedEventsSource;
  LinkedHashMap<DateTime, List<Event>>? selectedEvents;

  DateTime _focusedDay = DateTime.now();
  CalendarFormat _format = CalendarFormat.month;

  @override
  void initState() {
    selectedEventsSource = {
      DateTime.now(): [
        Event(
          title: "Cooking",
          description:
              "This is the description of the above event. i'm just writing this to make it a big passage. I need more wordsss okay fine let me type some more words some more words once more and yes it's done I think this will make a big passage.... Hopefully Contact for more info",
        ),
        Event(
          title: "come on",
          description:
              "This is the description of the above event. i'm just writing this to make it a big passage. I need more wordsss okay fine let me type some more words some more words once more and yes it's done I think this will make a big passage.... Hopefully Contact for more info",
        )
      ],
      DateTime(2022, 1, 10): [
        Event(
          title: "Superrr",
          description:
              "This is the description of the above event. i'm just writing this to make it a big passage. I need more wordsss okay fine let me type some more words some more words once more and yes it's done I think this will make a big passage.... Hopefully Contact for more info",
        )
      ],
      DateTime(2022, 1, 26): [
        Event(
            title: "Republic Day",
            description: "Everyone come at A03 for our event at 11:00 am")
      ]
    };
    int getHashCode(DateTime key) {
      return key.day * 1000000 + key.month * 10000 + key.year;
    }

    selectedEvents = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(selectedEventsSource!);

    super.initState();
  }

  List<Event> _getEventsFromDay(DateTime date) {
    return selectedEvents![date] != null ? selectedEvents![date]! : [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "Schedule",
            style: TextStyle(
                fontSize: 30, fontFamily: "Cairo", fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TableCalendar(
            //Calendar Styling

            daysOfWeekHeight: 30,
            daysOfWeekStyle: DaysOfWeekStyle(
                decoration: BoxDecoration(color: Colors.grey[200], boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1)
                ]),
                weekendStyle: TextStyle(
                    color: Colors.grey[800],
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
                weekdayStyle: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w700,
                    fontFamily: "Cairo",
                    fontSize: 15)),
            pageAnimationDuration: Duration(seconds: 1, milliseconds: 500),
            pageAnimationCurve: Curves.linearToEaseOut,
            headerStyle: HeaderStyle(
              headerPadding: EdgeInsets.symmetric(vertical: 12),
              titleCentered: true,
              leftChevronPadding: EdgeInsets.all(10),
              rightChevronPadding: EdgeInsets.all(10),
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "BalooBhaijaan2",
                  fontWeight: FontWeight.bold),
            ),

            calendarStyle: CalendarStyle(
                cellMargin: EdgeInsets.all(3),
                weekendTextStyle: TextStyle(
                  color: kLHomeColor,
                  fontFamily: "BalooBhaijaan2",
                ),
                defaultTextStyle: TextStyle(
                    color: kRHomeColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "BalooBhaijaan2"),
                selectedTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "BalooBhaijaan2"),
                selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient:
                        LinearGradient(colors: [kLHomeColor, kRHomeColor])),
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                todayTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "BalooBhaijaan2")),

            //Calendar Styling

            //Event Loader
            eventLoader: _getEventsFromDay,

            //Event Loader

            //Basic Data
            focusedDay: _focusedDay,
            firstDay: DateTime(2012, 2, 19),
            lastDay: DateTime(2022, 6, 20),
            onFormatChanged: (format) => setState(() => _format = format),
            calendarFormat: _format,

            //Changing Day
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                widget.controller.animateTo(
                    widget.controller.position.maxScrollExtent,
                    duration: Duration(seconds: 2),
                    curve: Curves.decelerate);
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            //Changing Day
          ),
        ),
        Text(
            "${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year} \tEvents",
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
        _getEventsFromDay(_selectedDay) == []
            ? Text("There are no events", style: TextStyle(color: Colors.black))
            : SizedBox(
                height: 0.011,
              ),
        ..._getEventsFromDay(_selectedDay).map((e) {
          return EventTile(e.title!, e.description!);
        }),
      ],
    );
  }
}
