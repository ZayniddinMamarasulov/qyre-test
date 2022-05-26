import 'package:flutter/material.dart';
import 'availability_item.dart';

class AvailabilityList extends StatelessWidget {
  const AvailabilityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return AvailabilityItem();
          }),
    );
  }
}
