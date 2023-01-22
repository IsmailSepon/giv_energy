part of 'battery_list_bloc.dart';

abstract class BatteryListEvent extends Equatable {
  const BatteryListEvent();
}

class FetchBatteryListEvent extends BatteryListEvent {
  @override
  List<Object?> get props => [];
}

class SearchByQueryEvent extends BatteryListEvent {
  final String query;
  final List<Data> list;

  const SearchByQueryEvent(this.query, this.list);

  @override
  List<Object?> get props => [query,list];


}
