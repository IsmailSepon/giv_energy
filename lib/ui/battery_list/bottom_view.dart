import 'package:flutter/material.dart';
import 'package:giv_energy/ui/battery_list/bloc/battery_list_bloc.dart';

class BottomView extends StatelessWidget {
  final BatteryListState state;

  const BottomView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 56,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Total Power:\n${state.totalPower}W"),
                Text("Avg. Battery Percentage:\n${state.avgPercentage}%")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
