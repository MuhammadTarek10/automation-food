import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/features/online_food_order/presentation/bloc/online_food_order_bloc.dart';
import 'package:auto_food/features/online_food_order/presentation/controllers/online_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomDetails extends StatefulWidget {
  const RoomDetails({Key? key}) : super(key: key);

  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  late final OnlineController controller;

  @override
  void initState() {
    super.initState();
    controller = OnlineController(bloc: context.read<OnlineFoodOrderBloc>());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnlineFoodOrderBloc, OnlineFoodOrderState>(
      listener: (context, state) {
        if (state is GetRoomOrdersSuccess) {}
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Room Details"),
        ),
      ),
    );
  }
}
