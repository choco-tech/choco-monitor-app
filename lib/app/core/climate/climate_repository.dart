import 'package:dio/dio.dart';
import 'package:choco_health_monitor/app/core/climate/climate_response.dart';

import 'climate_interface.dart';

// TODO: Try to improve this implementation
// TODO: Create the service
class ClimateRepository implements IClimateRepository {
  final Dio dio;

  static const baseURL =
      'https://api.thingspeak.com/channels/2104315/feeds.json';

  ClimateRepository(this.dio);

  @override
  Future<ClimateResponse?> getLast() async {
    final response = await dio.get<Map<String, dynamic>>(
        '$baseURL?api_key=ESPMGRFOV0UZ26PY&results=1');

    return ClimateResponse.fromMap(response.data ?? {'': null});
  }
}
