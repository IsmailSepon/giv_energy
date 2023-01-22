part of 'battery_list_bloc.dart';

class BatteryListState extends Equatable {
  final BatteryStatus status;
  final List<Data> batteryList;
  final List<Data> searchedList;
  final String errorMsg;
  final String totalPower;
  final String avgPercentage;

  const BatteryListState({
    this.status = BatteryStatus.initial,
    this.batteryList = const <Data>[],
    this.searchedList = const <Data>[],
    this.errorMsg = "",
    this.totalPower = "0",
    this.avgPercentage = "0",
  });

  BatteryListState copyWith({
    required BatteryStatus status,
    List<Data>? batteryList,
    List<Data>? searchedList,
    String? errorMsg,
    String? totalPower,
    String? avgPercentage,
  }) {
    return BatteryListState(
      status: status,
      batteryList: batteryList ?? this.batteryList,
      searchedList: searchedList ?? this.searchedList,
      errorMsg: errorMsg ?? this.errorMsg,
      totalPower: totalPower ?? this.totalPower,
      avgPercentage: avgPercentage ?? this.avgPercentage,
    );
  }

  @override
  List<Object?> get props =>
      [status, batteryList, errorMsg, totalPower, avgPercentage,searchedList];
}

enum BatteryStatus { initial, success, failed, searching }
