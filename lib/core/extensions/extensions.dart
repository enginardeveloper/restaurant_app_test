extension DateTimeExtension on DateTime {
  DateTime get removeNanosecond {
    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
    );
  }
}
