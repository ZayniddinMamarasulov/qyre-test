import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/domain/entities/card_dto.dart';

class CardsItem extends StatelessWidget {
  final CardDto cardDto;

  const CardsItem(this.cardDto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(int.parse(cardDto.color)),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      width: 120,
      height: 172,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            child: Image.asset(cardDto.imgUrl),
          ),
          const SizedBox(height: 12),
          Text(
            cardDto.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            cardDto.description,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }
}
