import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/domain/dto/available_dto.dart';

import '../../../../commons/utils.dart';

class TopAvailabilityItem extends StatelessWidget {
  final AvailableDto day;

  const TopAvailabilityItem(this.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: const BoxDecoration(
            color: Color(0xff111111),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          margin: const EdgeInsets.only(right: 8.0),
          height: 48,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  day.date == "Mon Oct 18"
                      ? const Text("TODAY",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff9C9C9C),
                            fontWeight: FontWeight.bold,
                          ))
                      : SizedBox(),
                  const SizedBox(width: 2),
                  Text(day.date.split(" ")[0],
                      style: const TextStyle(
                        height: 1.4,
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Row(
                children: [
                  day.status != AvailabilityStatus.NOT_SET
                      ? Utils.buildDot(Utils.getAvailabilityColor(day.status))
                      : const SizedBox(),
                  Text(day.date.split(" ")[2],
                      style: const TextStyle(
                          height: 1.4,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
