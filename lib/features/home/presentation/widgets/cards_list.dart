import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/domain/entities/card_dto.dart';

import 'cards_item.dart';

class CardsList extends StatelessWidget {
  const CardsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: CardDto.cardsList.length,
          itemBuilder: (BuildContext context, int index) {
            return CardsItem(CardDto.cardsList[index]);
          }),
    );
  }
}
