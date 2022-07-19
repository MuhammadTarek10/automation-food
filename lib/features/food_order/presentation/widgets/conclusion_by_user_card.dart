import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:flutter/material.dart';

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
      ],
    );
  }
}
