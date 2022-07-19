import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/widgets/conclusion_by_order_card.dart';
import 'package:auto_food/features/food_order/presentation/widgets/conclusion_by_user_card.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class LocalConclusionViewController {
  final FoodOrderBloc foodOrderBloc;

  const LocalConclusionViewController({required this.foodOrderBloc});

  void getConclusionByOrder() {
    foodOrderBloc.add(GetConclusionByOrderEvent());
  }

  void getConclusionByUser() {
    foodOrderBloc.add(GetConclusionByUserEvent());
  }

  Widget buildConclusionByOrder(LocalConclusionOrderModel conclusion) {
    return ConclusionByOrderCard(conclusion: conclusion);
  }

  Widget buildConclusionByUser(LocalConclusionUserModel conclusion) {
    return ConclusionByUserCard(conclusion: conclusion);
  }

  List<Widget> buildRest(BuildContext context, final conclusion) {
    return [
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
                style: TextStyle(
                  color: AppColors.conclusionCardTextColor,
                ),
              ),
              Text(
                conclusion.total.toString(),
                style:
                    const TextStyle(color: AppColors.conclusionCardTextColor),
              )
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
                style: TextStyle(color: AppColors.conclusionCardTextColor),
              ),
              Text(
                conclusion.payed.toString(),
                style:
                    const TextStyle(color: AppColors.conclusionCardTextColor),
              )
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
                style: TextStyle(color: AppColors.conclusionCardTextColor),
              ),
              Text(
                conclusion.remaining.toString(),
                style:
                    const TextStyle(color: AppColors.conclusionCardTextColor),
              )
            ],
          ),
          color: AppColors.conclusionCardHighlited,
          avatar: const Icon(
            Icons.attach_money,
          ),
        ),
        SizedBox(
          height:
              context.height * AppSizes.conclusionCardSizeDifferencePrecentage,
        ),
    ];
  }
}
