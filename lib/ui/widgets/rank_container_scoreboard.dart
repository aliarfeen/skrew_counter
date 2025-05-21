// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';

class RankContainerScoreBoard extends StatelessWidget {
  final int rank;
  final String playerName;
  final int score;
  const RankContainerScoreBoard({
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
            Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  context: context,
                  text: "$rank",
                  color: AppColors.appSecColor,
                  fontsize: 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  playerName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LBC',
                    color: AppColors.appSecColor,
                  ),
                )
              ],
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                const SizedBox(
                  width: 20,
                ),
                AppText(
                  context: context,
                  text: score.toString(),
                  color: AppColors.appSecColor,
                  fontsize: 20,
                )
              ],
            ),
          ],
        ));
  }
}
