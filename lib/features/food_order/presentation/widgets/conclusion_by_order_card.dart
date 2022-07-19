import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:flutter/material.dart';

class ConclusionByOrderCard extends StatelessWidget {
  final LocalConclusionOrderModel conclusion;
  const ConclusionByOrderCard({
    Key? key,
    required this.conclusion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var key in conclusion.orderCount.keys)
          ExpansionTile(
            title: Center(child: Text(key)),
            trailing: Text(
              conclusion.orderCount[key]!.keys
                  .map((e) => e.toString())
                  .join(', '),
              style: TextStyle(
                fontSize: context.width *
                    AppSizes.conclusionCardNumberOfOrdersPrecentage,
              ),
            ),
            children: [
              for (var orders in conclusion.orderCount[key]!.values)
                for (var order in orders)
                  ListTile(
                    title: Text(order.name.toString()),
                    trailing: Text(order.remaining.toString()),
                  )
            ],
          ),
      ],
    );
  }
}
