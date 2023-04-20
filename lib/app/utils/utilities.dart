int createUniqueId() {
  return DateTime.now().microsecondsSinceEpoch.remainder(100000);
}
