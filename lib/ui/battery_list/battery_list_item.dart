import 'package:flutter/material.dart';

import '../../domain/models/battery_list_response_model.dart';
import '../../utils/date_helper.dart';

class BatteryListItem extends StatelessWidget {
  final Data batteryData;

  const BatteryListItem({Key? key, required this.batteryData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lastOnlineDate = DateHelper.formatDate(input: batteryData.lastOnline!);
    var commissionDate =
        DateHelper.formatDate(input: batteryData.commissionDate!);

    var expirationDateTime = DateHelper.getDateTimeFromString(
        input: batteryData.warranty!.expiryDate!);
    var expirationLeft =
        expirationDateTime.difference(DateTime.now()).inDays ~/ 365;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${batteryData.serial}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.battery_charging_full_outlined,
                      size: 16,
                      color: Colors.deepOrange,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      "${((batteryData.values?.current)! * (batteryData.values?.voltage)!).toStringAsFixed(2)} W",
                      style: const TextStyle(color: Colors.deepOrange),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text("Last Online: $lastOnlineDate"),
                const SizedBox(
                  height: 2,
                ),
                Text("Commissioned at: $commissionDate"),
                const SizedBox(
                  height: 2,
                ),
                Text("Expiration left: $expirationLeft years"),
                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 20,
                decoration: BoxDecoration(
                    color: batteryData.status == "ONLINE"
                        ? Colors.green
                        : Colors.red,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                    )),
                child: Center(
                    child: Text(
                  "${batteryData.status}",
                  style: const TextStyle(color: Colors.white),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: percentageColor(batteryData.values?.percentage),
                        width: 5.0,
                      )),
                  child: Center(
                    child: Text(
                      "${batteryData.values?.percentage}%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color:
                              percentageColor(batteryData.values?.percentage)),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Color percentageColor(num? percentage) {
    if (percentage != null) {
      if (percentage < 20) {
        return Colors.red;
      } else if (percentage > 20 && percentage < 90) {
        return Colors.orange;
      } else {
        return Colors.green;
      }
    } else {
      return Colors.red;
    }
  }
}
