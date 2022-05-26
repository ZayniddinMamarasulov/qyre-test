import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/domain/dto/available_dto.dart';
import 'availability_item.dart';

class AvailabilityList extends StatelessWidget {
  const AvailabilityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AvailableDto.days.length,
          itemBuilder: (BuildContext context, int index) {
            return AvailabilityItem(AvailableDto.days[index]);
          }),
    );
  }
}
