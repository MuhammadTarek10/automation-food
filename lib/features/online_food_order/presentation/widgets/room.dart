import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/online_food_order/domain/entities/room.dart';
import 'package:flutter/material.dart';

class Room extends StatelessWidget {
  const Room({Key? key, required this.room, required this.onTap})
      : super(key: key);

  final OnlineRoom room;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.05,
          vertical: context.height * 0.01,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(context.width * 0.03),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Name: ${room.name}"),
              SizedBox(height: context.height * 0.02),
              Text("Code: ${room.code}"),
            ],
          ),
        ),
      ),
    );
  }
}
