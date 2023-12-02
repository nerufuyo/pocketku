import 'package:intl/intl.dart';

class Time {
  String getCurrentDate() {
    final now = DateTime.now();
    final formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(now);
  }

  String getCurrentTime() {
    final now = DateTime.now();
    final formatter = DateFormat('HH:mm');
    return formatter.format(now);
  }

  String getDayName() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE');
    return formatter.format(now);
  }
}
