class AppFormat {
  static String date(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  static String currency(double amount) {
    return '${amount.toString()} FCFA';
  }
}
