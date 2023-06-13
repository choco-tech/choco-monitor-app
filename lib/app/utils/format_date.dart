import 'package:sprintf/sprintf.dart';

extension FormatDate on DateTime {
  String humanize() {
    final date = this;
    return sprintf(
      '%02i/%02i/${date.year} %02i:%02i:%02i',
      [date.day, date.month, date.hour, date.minute, date.second],
    );
  }
}
