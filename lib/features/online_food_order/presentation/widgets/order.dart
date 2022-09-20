import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/online_food_order/domain/entities/order_in_room.dart';
import 'package:flutter/material.dart';

class OnlineOrderCard extends StatelessWidget {
  const OnlineOrderCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final OrderInRoom data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.paddingAll),
          child: CircleAvatar(
            backgroundColor:
                data.order.done ? AppColors.primary : AppColors.hint,
            radius: context.width * AppSizes.orderCardAvatarRadiusPrecentage,
            child: Text(
              data.order.price.toString(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.user.name,
                      style: Theme.of(context).textTheme.headlineLarge),
                  Text(data.order.name,
                      style: Theme.of(context).textTheme.headline4)
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: context.width * AppSizes.differenceBetweenOrderNameAndMoney,
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: context.height * AppSizes.deleteContainerHeightPrecentage,
            width: context.width * AppSizes.deleteContainerWidthPrecentage,
            child: const Icon(Icons.delete),
          ),
        )
      ],
    );
    
  }
}


/*
return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.05,
        vertical: context.height * 0.02,
      ),
      child: Container(
        width: double.infinity,
        height: context.height * 0.08,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(context.width * 0.02),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.user.name),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(data.order.name),
                  Text(data.order.price.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
*/