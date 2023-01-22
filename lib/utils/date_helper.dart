import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(
      {String givenPattern = "yyyy-MM-ddTHH:mm:ssZ",
      String desiredPattern = "dd MMM yyyy",
      required String input}) {
    var givenDateFormat = DateFormat(givenPattern);
    var desiredDateFormat = DateFormat(desiredPattern);
    var lastOnline = givenDateFormat.parse(input);
    return desiredDateFormat.format(lastOnline);
  }

  static DateTime getDateTimeFromString({
    String givenPattern = "yyyy-MM-ddTHH:mm:ssZ",
    required String input
}) {
    var givenDateFormat = DateFormat(givenPattern);
    return givenDateFormat.parse(input);
  }

}
