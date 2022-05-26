import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/domain/entities/production_dto.dart';
import 'package:qyre_test/features/home/presentation/widgets/production_item.dart';

class ProductionList extends StatelessWidget {
  const ProductionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 220,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's productions",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xff444444)),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: ProductionDto.productionsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductionItem(ProductionDto.productionsList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
