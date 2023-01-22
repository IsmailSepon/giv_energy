import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giv_energy/ui/battery_list/bloc/battery_list_bloc.dart';
import 'package:giv_energy/ui/battery_list/bottom_view.dart';

import 'battery_list_item.dart';

class BatteryListPage extends StatelessWidget {
  const BatteryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BatteryListBloc, BatteryListState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("GivEnergy"),
          ),
          body: Body(state: state),
          bottomNavigationBar: BottomView(state: state),
        );
      },
    );
  }
}

class Body extends StatefulWidget {
  final BatteryListState state;

  const Body({Key? key, required this.state}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController? _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.state.status) {
      case BatteryStatus.failed:
        return Center(
          child: Text(widget.state.errorMsg),
        );
      case BatteryStatus.initial:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case BatteryStatus.success:
      case BatteryStatus.searching:
        var list = widget.state.status == BatteryStatus.searching ? widget.state.searchedList : widget.state.batteryList;
        return SizedBox(
          child: Column(
            children: [
              searchView(state: widget.state),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return BatteryListItem(
                        batteryData: list[index]);
                  },
                  itemCount: list.length,
                ),
              ),
            ],
          ),
        );
    }
  }

  Card searchView({required BatteryListState state}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: TextField(
          controller: _searchController,
          autofocus: false,
          onChanged: (value) {
            context.read<BatteryListBloc>().add(
                SearchByQueryEvent(_searchController!.text, state.batteryList));
          },
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            border: InputBorder.none,
            filled: false,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search by Serial Number",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
