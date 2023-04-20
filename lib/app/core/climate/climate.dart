class Climate {
  final double temperature;
  final double humidity;
  final DateTime date;

  Climate(this.temperature, this.humidity, this.date);

  Climate.fromMap(Map<String, dynamic> data)
      : temperature = double.parse(data['field1']),
        humidity = double.parse(data['field2']),
        date = DateTime.parse(data['created_at']);

  static toList(List<dynamic> list) {
    List<Climate> items = [];
    for (Map<String, dynamic> data in list) {
      items.add(Climate.fromMap(data));
    }
    return items;
  }

  Map<String, dynamic> toMap() {
    return {
      'field1': temperature,
      'filed2': humidity,
      'created_at': date,
    };
  }
}
