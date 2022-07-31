import 'package:intl/intl.dart';

class AppFormat {
  static String date(String stringDate) {
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MM yyyy', 'id_ID').format(dateTime);
  }
}
