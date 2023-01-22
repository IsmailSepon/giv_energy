import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:giv_energy/domain/models/battery_list_response_model.dart';
import 'package:giv_energy/domain/repos/battery_list_repo.dart';
import 'package:giv_energy/utils/config.dart';

class BatteryListRepoImpl extends BatteryListRepo {
  @override
  Future<List<Data>?> fetchBatteryList() async {
    String data = await rootBundle.loadString(jsonFileName);
    final json = jsonDecode(data);
    final BatteryListResponseModel responseModel = BatteryListResponseModel.fromJson(json);
    return responseModel.data;
  }

}