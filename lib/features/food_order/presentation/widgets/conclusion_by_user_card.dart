import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ConclusionByUserCard extends StatelessWidget {
  final LocalConclusionUserModel conclusion;
  const ConclusionByUserCard({
    Key? key,
    required this.conclusion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var key in conclusion.userCount.keys)
          ExpansionTile(
            title: Center(child: Text(key)),
            trailing: Text(
              conclusion.userCount[key]!
                  .map((order) => order.remaining)
                  .reduce((a, b) => a + b)
                  .toString(),
              style: TextStyle(
                fontSize: context.width *
                    AppSizes.conclusionCardNumberOfUsersPrecentage,
              ),
            ),
            children: [
              for (var order in conclusion.userCount[key]!)
                ListTile(
                  title: Text(order.order.toString()),
                  trailing: Text(order.remaining.toString()),
                )
            ],
          ),
        SizedBox(
          height:
              context.height * AppSizes.conclusionCardSizeDifferencePrecentage,
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
        SizedBox(
          height:
              context.height * AppSizes.conclusionCardSizeDifferencePrecentage,
        ),
      ],
    );
  }
}
