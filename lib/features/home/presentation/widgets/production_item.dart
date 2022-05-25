import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/domain/entities/production_dto.dart';

class ProductionItem extends StatelessWidget {
  final ProductionDto productionDto;

  const ProductionItem(this.productionDto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffF0F2F5),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 82,
            height: 82,
            child: Image.asset(productionDto.imgUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    productionDto.title,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 4),
                Text(productionDto.period)
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_right),
          )
        ],
      ),
    );
  }
}
