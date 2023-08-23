import 'package:intl/intl.dart';

class Date {
  static DateFormat dateFormat = DateFormat.d().add_MMM().add_y();
  static DateFormat parseDateFormat = DateFormat(r'dd MMM yyyy');
  static DateTime now = DateTime.now().toLocal();
  static String todayDate = dateFormat.format(now);
}
