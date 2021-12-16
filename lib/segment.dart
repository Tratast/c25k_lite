class Segment {
  static int _idCount = 0;
  late int _id;
  int hours;
  int minutes;
  int seconds;
  String tone;
  String activity;
  num? miles;

  Segment(this.hours, this.minutes, this.seconds, this.tone, this.activity, this.miles): _id = Segment._idCount++;

  Segment.defaultTone(hours, minutes, seconds, activity, miles): this(hours, minutes, seconds, 'default', activity, miles);

  @override
  bool operator == (other) {
    return (other is Segment)
      && other._id == _id
      && other.hours == hours
      && other.minutes == minutes
      && other.seconds == seconds
      && other.tone == tone
      && other.activity == activity;
  }

  @override
  int get hashCode => _id.hashCode ^ hours.hashCode ^ minutes.hashCode ^ seconds.hashCode ^ tone.hashCode ^ activity.hashCode;
}