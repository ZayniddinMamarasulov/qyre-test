import 'package:flutter/material.dart';

class CompleteCards extends StatelessWidget {
  const CompleteCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container();
      },
    );
  }
}
