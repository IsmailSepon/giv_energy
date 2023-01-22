import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:giv_energy/domain/models/battery_list_response_model.dart';

import '../../../domain/repos/battery_list_repo.dart';

part 'battery_list_event.dart';

part 'battery_list_state.dart';

class BatteryListBloc extends Bloc<BatteryListEvent, BatteryListState> {
  final BatteryListRepo _batteryListRepo;

  BatteryListBloc({required BatteryListRepo batteryListRepo})
      : _batteryListRepo = batteryListRepo,
        super(const BatteryListState()) {
    on<FetchBatteryListEvent>(_fetchBatteryList);
    on<SearchByQueryEvent>(_searchByQuery);
  }

  FutureOr<void> _fetchBatteryList(FetchBatteryListEvent event,
      Emitter<BatteryListState> emit) async {
    emit(state.copyWith(status: BatteryStatus.initial));
    List<Data>? batteryList = await _batteryListRepo.fetchBatteryList();

    if (batteryList != null) {
      if (batteryList.isNotEmpty) {
        List<num> totalPower = batteryList
            .map((e) =>
        e.values!.current!.toDouble() * e.values!.voltage!.toDouble())
            .toList();
        List<num> totalPercentage =
        batteryList.map((e) => e.values!.percentage!.toDouble()).toList();
        double netPower =
        totalPower.fold(0, (previous, current) => previous + current);
        double netPercentage =
        totalPercentage.fold(0, (previous, current) => previous + current);

        emit(state.copyWith(
          status: BatteryStatus.success,
          batteryList: batteryList,
          totalPower: netPower.toStringAsFixed(2),
          avgPercentage:
          (netPercentage / batteryList.length).toStringAsFixed(2),
        ));
      } else {
        emit(state.copyWith(
            status: BatteryStatus.failed, errorMsg: "No Batteries found"));
      }
    } else {
      emit(state.copyWith(
          status: BatteryStatus.failed, errorMsg: "Battery list fetch failed"));
    }
  }

  FutureOr<void> _searchByQuery(SearchByQueryEvent event,
      Emitter<BatteryListState> emit) async {
    emit(state.copyWith(status: BatteryStatus.initial));
    if (event.query.isEmpty) {
      emit(state.copyWith(
          status: BatteryStatus.success, batteryList: event.list));
    } else {
      var list = event.list.where((element) =>
          element
              .serial!
              .toLowerCase()
              .contains(event.query.toLowerCase())).toList();

      List<num> totalPower = list
          .map((e) =>
      e.values!.current!.toDouble() * e.values!.voltage!.toDouble())
          .toList();
      List<num> totalPercentage =
      list.map((e) => e.values!.percentage!.toDouble()).toList();
      double netPower =
      totalPower.fold(0, (previous, current) => previous + current);
      double netPercentage =
      totalPercentage.fold(0, (previous, current) => previous + current);

      emit(state.copyWith(
        status: BatteryStatus.searching,
        batteryList: event.list,
        searchedList: list,
        totalPower: netPower.toStringAsFixed(2),
        avgPercentage: (netPercentage / list.length).toStringAsFixed(2),),);
    }
  }
}
