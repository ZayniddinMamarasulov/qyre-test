import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/presentation/widgets/availability_list.dart';
import 'package:qyre_test/features/home/presentation/widgets/cards_list.dart';
import 'package:qyre_test/features/home/presentation/widgets/complete_list.dart';
import 'package:qyre_test/features/home/presentation/widgets/production_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "My Availability",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              AvailabilityList(),
              CompleteCards(),
              ProductionList(),
              CardsList()
            ],
          ),
        ));
  }
}
