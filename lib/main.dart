import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giv_energy/data/battery_list_repo_impl.dart';
import 'package:giv_energy/ui/battery_list/battery_list_page.dart';

import 'ui/battery_list/bloc/battery_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GivEnergy',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BlocProvider(
        create: (_) => BatteryListBloc(batteryListRepo: BatteryListRepoImpl())..add(FetchBatteryListEvent()),
        child: const BatteryListPage(),
      ),
    );
  }
}
