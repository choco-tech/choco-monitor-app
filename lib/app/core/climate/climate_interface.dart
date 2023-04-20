import 'package:choco_health_monitor/app/core/climate/climate_response.dart';

abstract class IClimateRepository {
  Future<ClimateResponse?> getLast();
}
