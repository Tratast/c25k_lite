import 'package:c25k_lite/segment.dart';

class Day {
  static int idCount = 0;
  final int _id = Day.idCount++;
  final List<Segment> _segments = [];
  int _index = -1;
  bool completed = false;
  final int week;
  final int number;

  Day(this.week, this.number);

  String description() {
    int hours = 0;
    int minutes = 0;
    int seconds = 0;
    for (Segment s in _segments) {
      hours += s.hours;
      minutes += s.minutes;
      seconds += s.seconds;
    }

    minutes += seconds ~/ 60;
    seconds = seconds % 60;
    hours += minutes ~/ 60;
    minutes = minutes % 60;

    return 'A $hours Hour $minutes Minute $seconds Second Workout!';
  }

  Segment? currentSegment() {
    if (_segments.isNotEmpty) {
      return _segments[_index];
    }

    return null;
  }

  Segment? nextSegment() {
    if (_segments.isNotEmpty && _segments.length - 1 > _index) {
      _index++;
      return _segments[_index];
    }

    return null;
  }

  Segment? previousSegment() {
    if (_segments.isNotEmpty && _index > 0) {
      _index--;
      return _segments[_index];
    }

    return null;
  }

  void addSegment(Segment segment) {
    if (_segments.isEmpty) {
      _index = 0;
    }

    _segments.add(segment);
  }

  Segment? removeSegment(Segment segment) {
    int index = _segments.indexOf(segment);

    if (index != -1) {
      if (_segments.length == 1) {
        _index = -1;
      } else {
        if (_segments.last == segment) {
          _index = 0;
        }
      }

      return _segments.removeAt(index);
    }

    return null;
  }

  @override
  bool operator == (other) {
    return (other is Day)
        && other._id == _id
        && other._segments == _segments
        && other._index == _index
        && other.completed == completed;
  }

  @override
  int get hashCode => _id.hashCode ^ _segments.hashCode ^ _index.hashCode ^ completed.hashCode;

}