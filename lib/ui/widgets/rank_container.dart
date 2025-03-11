// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';

class RankContainer extends StatelessWidget {
  int rank;
  String playerName;
  int score;
  RankContainer({
    Key? key,
    required this.rank,
    required this.playerName,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 1,
        padding: EdgeInsets.all(16),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_upward,
              color: AppColors.appSecColor,
            ),
            AppText(
              text: rank.toString(),
              color: AppColors.appSecColor,
              fontsize: 20,
            ),
            SizedBox(
              width: 80,
              height: 50,
              child: AppText(
                text: playerName,
                color: AppColors.appSecColor,
                fontsize: 18,
              ),
            ),
            Icon(
              Icons.add_circle,
              color: AppColors.appSecColor,
            ),
            Icon(
              Icons.incomplete_circle_rounded,
              color: AppColors.appSecColor,
            ),
            AppText(
              text: score.toString(),
              color: AppColors.appSecColor,
              fontsize: 20,
            )
          ],
        ));
  }
}
