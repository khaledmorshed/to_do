class DateTimeFormater {
  static String formatDate(DateTime dateTime) {
    // Define month names
    List<String> months = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    // Extract day, month, and year
    int day = dateTime.day;
    String month = months[dateTime.month - 1];
    int year = dateTime.year;
    // Return formatted string
    return "$day $month, $year";
  }
}