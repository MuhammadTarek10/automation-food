import 'dart:async';
import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/features/food_order/data/models/local_order_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

typedef OrderCallBack = void Function(LocalOrderModel order);

// ignore: must_be_immutable
class OrderCard extends StatelessWidget {
  final LocalOrderModel order;

  final OrderCallBack onDelete;
  final OrderCallBack onEdit;
  final OrderCallBack onDone;

  StreamController<int> doneStreamController = StreamController<int>();

  OrderCard(
      {Key? key,
      required this.order,
      required this.onDelete,
      required this.onEdit,
      required this.onDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: doneStreamController.stream,
      builder: (context, snapshot) {
        return GFListTile(
          avatar: GFAvatar(
            backgroundColor: snapshot.hasData && snapshot.data == 1
                ? AppColors.primary
                : AppColors.hint,
            child: Text(order.remaining.toString()),
          ),
          titleText: order.name,
          subTitleText: order.order,
          icon: InkWell(
            child: const Icon(Icons.delete),
            onTap: () => onDelete(order),
          ),
          onTap: () => onEdit(order),
          onLongPress: () {
            order.done = (order.done - 1).abs();
            doneStreamController.add(order.done);
          },
        );
      },
    );
  }
}
