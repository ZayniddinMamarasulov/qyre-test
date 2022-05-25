import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/domain/entities/complete_dto.dart';

class CompleteItem extends StatelessWidget {
  final CompleteDto completeDto;

  const CompleteItem(this.completeDto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey,
        //     offset: Offset(0.0, 1.0), //(x,y)
        //     blurRadius: 4.0,
        //   ),
        // ],
        color: Color(0xffF0F2F5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      width: 300,
      height: 172,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            completeDto.title ?? "...",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1.4,
                color: Color(0xff111111)),
          ),
          const SizedBox(height: 18),
          Container(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(
                minHeight: 10,
                backgroundColor: Colors.white,
                color: const Color(0xff87C6F5),
                value: completeDto.progress! / 100,
              )),
          const SizedBox(height: 18),
          InkWell(
            onTap: () {},
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Complete profile",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
