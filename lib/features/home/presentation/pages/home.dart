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
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "My Availability",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                AvailabilityList(),
                SizedBox(height: 16),
                CompleteCards(),
                SizedBox(height: 16),
                ProductionList(),
                SizedBox(height: 16),
                CardsList()
              ],
            ),
          ),
        ));
  }
}
