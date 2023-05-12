class Room {
  final String roomId;
  final String name;
  final int celsius;
  final int humidity;
  final DateTime updatedAt;

  Room(
    this.roomId,
    this.name,
    this.celsius,
    this.humidity,
    this.updatedAt,
  );

  static Room fromMap(Map<Object?, Object?> map) {
    return Room(
      map['roomId'] as String,
      map['roomName'] as String,
      map['celsius'] as int,
      map['humidity'] as int,
      DateTime.fromMicrosecondsSinceEpoch((map['updatedAt'] as int) * 1000),
    );
  }
}
