import 'dart:async';
import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/food_order/data/models/local_order_model.dart';
import 'package:flutter/material.dart';

typedef OrderCallBack = void Function(LocalOrderModel order);

// ignore: must_be_immutable
class OrderCard extends StatelessWidget {
  final LocalOrderModel order;

  final OrderCallBack onDelete;
  final OrderCallBack onEdit;
  final OrderCallBack onDone;

  StreamController<int> doneStreamController = StreamController<int>();

  OrderCard({
    Key? key,
    required this.order,
    required this.onDelete,
    required this.onEdit,
    required this.onDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.paddingAll),
          child: CircleAvatar(
            radius: context.width * AppSizes.orderCardAvatarRadiusPrecentage,
            backgroundColor: order.remaining < 0
                ? AppColors.orderCardAvatarColor
                : order.remaining == 0
                    ? Colors.grey
                    : Colors.green,
            child: Text(
              order.remaining.abs().toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () => onEdit(order),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.name,
                        style: Theme.of(context).textTheme.headlineLarge),
                    Text(order.order,
                        style: Theme.of(context).textTheme.headline4)
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () => onEdit(order),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price: ${order.price}",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  "Payed: ${order.payed}",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: context.width * AppSizes.differenceBetweenOrderNameAndMoney,
        ),
        InkWell(
          onTap: () => onDelete(order),
          child: Container(
            height: context.height * AppSizes.deleteContainerHeightPrecentage,
            width: context.width * AppSizes.deleteContainerWidthPrecentage,
            padding: const EdgeInsets.only(right: 0),
            child: const Icon(Icons.delete),
          ),
        )
      ],
    );
  }
}
