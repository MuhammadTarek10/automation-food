
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/online_food_order/domain/entities/conclusion.dart';
import 'package:flutter/material.dart';

class ConclusionCard extends StatelessWidget {
  const ConclusionCard({
    Key? key,
    required this.conclusion,
  }) : super(key: key);

  final OnlineConclusion conclusion;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var key in conclusion.orders.keys)
          ExpansionTile(
            title: Center(child: Text(key)),
            trailing: Text(
              conclusion.orders[key]!.keys.map((e) => e.toString()).join(', '),
              style: TextStyle(
                fontSize: context.width *
                    AppSizes.conclusionCardNumberOfOrdersPrecentage,
              ),
            ),
            children: [
              for (var orders in conclusion.orders[key]!.values)
                for (var item in orders)
                  ListTile(
                    title: Text(item.name),
                    trailing: Text(item.price.toString()),
                  ),
            ],
          ),
      ],
    );
  }
}
