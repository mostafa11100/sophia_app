String converttime(DateTime t) {
  DateTime time = DateTime.now();
  if (t.month == time.month && t.year == time.year) {
    int day = time.day - t.day;
    if (day == 0) {
      if (t.hour == time.hour) {
        return "${time.minute - t.minute}m ago";
      } else {
        return "${time.hour - t.hour}h ago";
      }
    } else {
      if (day <= 2) {
        return "yesterday";
      }
    }
  }

  return "${t.day}/${t.month}/${t.year}";
}
