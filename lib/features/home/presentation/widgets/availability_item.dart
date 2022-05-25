import 'package:flutter/material.dart';

class AvailabilityItem extends StatelessWidget {
  const AvailabilityItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      width: 90,
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("TODAY",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff9C9C9C),
                fontWeight: FontWeight.w300,
              )),
          SizedBox(height: 4.0),
          Text("Mon",
              style: TextStyle(
                height: 1.4,
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w200,
              )),
          Text("Oct",
              style: TextStyle(
                height: 1.4,
                color: Colors.white,
                fontSize: 12,
              )),
          Text("18",
              style: TextStyle(
                  height: 1.4,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
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
