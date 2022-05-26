import 'dart:ui';

import '../features/home/domain/dto/available_dto.dart';

class Utils {
  static Color getAvailabilityColor(AvailabilityStatus status) {
    Color color = const Color(0xffEC4E27);
    if (status == AvailabilityStatus.BUSY) color = const Color(0xffEC4E27);
    if (status == AvailabilityStatus.FREE) color = const Color(0xff87C6F5);
    return color;
  }
}
