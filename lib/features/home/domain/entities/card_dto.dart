import 'package:flutter/material.dart';

class CardDto {
  final String title;
  final String imgUrl;
  final String description;
  final String color;

  const CardDto(this.title, this.imgUrl, this.description, this.color);

  static const List<CardDto> cardsList = [
    CardDto("My network", "assets/images/card_1.png",
        "Connect and grow your network", "0xff3465C3"),
    CardDto("Quick hire", "assets/images/card_2.png",
        "Connect and grow your network", "0xffEC4E27"),
    CardDto("My network", "assets/images/card_3.png",
        "Connect and grow your network", "0xff6B34C3"),
  ];
}
