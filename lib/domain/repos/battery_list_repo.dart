import 'package:giv_energy/domain/models/battery_list_response_model.dart';

abstract class BatteryListRepo {
  Future<List<Data>?> fetchBatteryList();
}