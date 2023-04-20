import 'package:choco_health_monitor/app/core/climate/climate.dart';

class ClimateResponse {
  final Channel channel;
  final List<Climate> feeds;

  ClimateResponse(
    this.channel,
    this.feeds,
  );

  ClimateResponse.fromMap(Map<String, dynamic> data)
      : channel = Channel.fromMap(data['channel']),
        feeds = Climate.toList(data['feeds']);
}

class Channel {
  final int id;
  final String name;
  final String latitude;
  final String longitude;
  final String field1;
  final String field2;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int lastEntryId;

  Channel(
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.field1,
    this.field2,
    this.createdAt,
    this.updatedAt,
    this.lastEntryId,
  );

  Channel.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        latitude = data['latitude'],
        longitude = data['longitude'],
        field1 = data['field1'],
        field2 = data['field2'],
        createdAt = DateTime.parse(data['created_at']),
        updatedAt = DateTime.parse(data['updated_at']),
        lastEntryId = data['last_entry_id'] ?? 0;
}
