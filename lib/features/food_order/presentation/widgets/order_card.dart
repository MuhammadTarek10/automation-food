import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/features/food_order/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

typedef OrderCallBack = void Function(OrderModel order);

class OrderCard extends StatelessWidget {
  final OrderModel order;

  final OrderCallBack onDelete;
  final OrderCallBack onEdit;

  const OrderCard({
    Key? key,
    required this.order,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      avatar: GFAvatar(
        backgroundColor: AppColors.hint,
        child: Text(order.name[0].toString()),
      ),
      titleText: order.name,
      subTitleText: order.order,
      icon: InkWell(
        child: const Icon(Icons.delete),
        onTap: () => onDelete(order),
      ),
      onTap: () => onEdit(order),
    );
  }
}
