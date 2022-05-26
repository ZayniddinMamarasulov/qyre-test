import 'package:flutter/material.dart';

class StarredPosts extends StatelessWidget {
  const StarredPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Starred Posts",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xff444444)),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffF0F2F5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            margin: const EdgeInsets.only(right: 14),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
            height: 128.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    "assets/images/starred.png",
                  ),
                ),
                Expanded(
                  child: Text(
                    "Posts that are extra relevant to you can be marked"
                    " with a star and will be shown here for easy access.",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
