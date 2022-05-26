import 'dart:math';
import 'package:flutter/material.dart';

import '../features/home/domain/dto/available_dto.dart';

class Utils {
  static Color getAvailabilityColor(AvailabilityStatus status) {
    Color color = const Color(0xffEC4E27);
    if (status == AvailabilityStatus.BUSY) color = const Color(0xffEC4E27);
    if (status == AvailabilityStatus.FREE) color = const Color(0xff87C6F5);
    return color;
  }

  static Widget buildDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
}
