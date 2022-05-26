import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/domain/dto/available_dto.dart';

import '../../../../commons/utils.dart';

class AvailabilityItem extends StatelessWidget {
  final AvailableDto day;

  const AvailabilityItem(this.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8.0),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          width: 90,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              day.date == "Mon Oct 18"
                  ? const Text("TODAY",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff9C9C9C),
                        fontWeight: FontWeight.w300,
                      ))
                  : SizedBox(),
              const SizedBox(height: 4.0),
              Text(day.date.split(" ")[0],
                  style: const TextStyle(
                    height: 1.4,
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  )),
              Text(day.date.split(" ")[1],
                  style: const TextStyle(
                    height: 1.4,
                    color: Colors.white,
                    fontSize: 12,
                  )),
              Text(day.date.split(" ")[2],
                  style: const TextStyle(
                      height: 1.4,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              day.status != AvailabilityStatus.NOT_SET
                  ? buildDot(Utils.getAvailabilityColor(day.status))
                  : SizedBox()
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
