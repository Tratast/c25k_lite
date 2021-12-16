import 'package:c25k_lite/segment.dart';
import 'package:flutter/cupertino.dart';

import 'day.dart';
import 'default_program.dart';

class Program extends ChangeNotifier{
  List<Day> days = [];

  void populate() {
    days.clear();

    for (List week in defaultProgram) {
      int weekNumber = week[0];
      week.asMap().forEach((key, day) {
        if (key != 0) {
          Day newDay = Day(weekNumber, day[0]);
          day.asMap().forEach((i, segment) {
            if (i != 0) {
              num? miles;
              if (segment.length == 5) {
                miles = segment[4];
              }

              newDay.addSegment(
                  Segment.defaultTone(
                      segment[0],
                      segment[1],
                      segment[2],
                      segment[3],
                      miles
                  )
              );
            }
          });

          days.add(newDay);
        }
      });
    }

    notifyListeners();
  }
}