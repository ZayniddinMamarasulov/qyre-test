import 'package:flutter/material.dart';

class CompleteItem extends StatelessWidget {
  const CompleteItem({Key? key}) : super(key: key);

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
            "Complete your prpfile tooptimize your exposure in job searches",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1.4,
                color: Color(0xff111111)),
          ),
          SizedBox(height: 18),
          Container(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(
                minHeight: 10,
                backgroundColor: Colors.white,
                color: Color(0xff87C6F5),
                value: 0.7,
              )),
          SizedBox(height: 18),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
          )
        ],
      ),
    );
  }
}
