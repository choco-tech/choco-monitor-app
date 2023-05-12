extension FormatDate on DateTime {
  String humanize() {
    final date = this;
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}:${date.second}';
  }
}
