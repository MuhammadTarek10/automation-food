import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/food_order/data/models/conclusion_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ConclusionCard extends StatelessWidget {
  final ConclusionModel conclusion;
  const ConclusionCard({
    Key? key,
    required this.conclusion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var key in conclusion.orderCount.keys)
          GFListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  key,
                ),
                Text(conclusion.orderCount[key].toString())
              ],
            ),
            color: AppColors.primary,
            avatar: const Icon(
              Icons.attach_money,
            ),
          ),
        SizedBox(
          height: context.height * AppSizes.conclusionCardSizeDifference,
        ),
        GFListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.conclusionTotalText,
              ),
              Text(conclusion.total.toString())
            ],
          ),
          color: AppColors.hint,
          avatar: const Icon(
            Icons.attach_money,
          ),
        ),
        GFListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.conclusionPayedText,
              ),
              Text(conclusion.payed.toString())
            ],
          ),
          color: AppColors.hint,
          avatar: const Icon(
            Icons.attach_money,
          ),
        ),
        GFListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.conclusionRemainingText,
              ),
              Text(conclusion.remaining.toString())
            ],
          ),
          color: AppColors.hint,
          avatar: const Icon(
            Icons.attach_money,
          ),
        ),
      ],
    );
  }
}
