import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/presentation/widgets/complete_item.dart';

class CompleteCards extends StatelessWidget {
  const CompleteCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return CompleteItem();
        },
      ),
    );
  }
}
