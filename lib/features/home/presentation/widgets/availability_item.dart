import 'package:flutter/material.dart';

class AvailabilityItem extends StatelessWidget {
  const AvailabilityItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      width: 90,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("TODAY", style: TextStyle(color: Color(0xff9C9C9C))),
          SizedBox(height: 4.0),
          Text("Mon", style: TextStyle(color: Colors.white)),
          Text("Oct", style: TextStyle(color: Colors.white)),
          Text("18", style: TextStyle(color: Colors.white)),
          SizedBox(height: 24),
          buildDot(Color(0xffEC4E27))
        ],
      ),
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
