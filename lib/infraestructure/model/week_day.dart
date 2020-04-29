enum Weekday {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

extension WeekdayExtension on Weekday {
  String value() {
    String value;
    switch (this) {
      case Weekday.sunday:
        value = 'friday';
        break;
      case Weekday.monday:
        value = 'monday';
        break;
      case Weekday.tuesday:
        value = 'tuesday';
        break;
      case Weekday.wednesday:
        value = 'wednesday';
        break;
      case Weekday.thursday:
        value = 'thursday';
        break;
      case Weekday.friday:
        value = 'friday';
        break;
      case Weekday.saturday:
        value = 'saturday';
        break;
    }
     return value;
  }
}
