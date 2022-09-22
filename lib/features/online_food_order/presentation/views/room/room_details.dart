import 'dart:async';

import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/online_food_order/domain/entities/order_in_room.dart';
import 'package:auto_food/features/online_food_order/domain/entities/room.dart';
import 'package:auto_food/features/online_food_order/domain/entities/user.dart';
import 'package:auto_food/features/online_food_order/presentation/bloc/online_food_order_bloc.dart';
import 'package:auto_food/features/online_food_order/presentation/controllers/online_controller.dart';
import 'package:auto_food/features/online_food_order/presentation/widgets/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomDetails extends StatefulWidget {
  const RoomDetails({Key? key, required this.room}) : super(key: key);

  final OnlineRoom room;

  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  late final OnlineController controller;
  late final StreamController<List<OrderInRoom>> orderConroller;
  late final StreamController<OnlineRoom> roomController;
  late final TextEditingController nameController;
  late final TextEditingController priceController;
  late final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initState() {
    super.initState();
    controller = OnlineController(bloc: context.read<OnlineFoodOrderBloc>());
    orderConroller = StreamController<List<OrderInRoom>>();
    nameController = TextEditingController();
    priceController = TextEditingController();
    roomController = StreamController<OnlineRoom>.broadcast();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  void dispose() {
    orderConroller.close();
    nameController.dispose();
    priceController.dispose();
    roomController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.room.name),
        actions: [
          IconButton(
            onPressed: () {
              controller.getRoom(widget.room.id);
              scaffoldKey.currentState!.openEndDrawer();
            },
            icon: const Icon(Icons.people),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: StreamBuilder<OnlineRoom>(
          stream: roomController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.requireData.users.length + 1,
                itemBuilder: (context, index) {
                  List<User> users = snapshot.requireData.users;
                  users.add(snapshot.requireData.admin);
                  return Center(
                    child: ListTile(
                      title: Text(users[index].name),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      body: BlocConsumer<OnlineFoodOrderBloc, OnlineFoodOrderState>(
        listener: (context, state) {
          if (state is GetRoomOrdersSuccess) {
            orderConroller.add(state.orders);
          } else if (state is GenericSuccessState) {
            AppConstants.showSnackBar(
              context: context,
              message: state.message,
            );
            controller.getOrders();
          } else if (state is FailedState) {
            AppConstants.showSnackBar(
              context: context,
              message: state.message,
              color: AppColors.failure,
            );
          }
          if (state is GetRoomSuccessState) {
            roomController.add(state.room);
          }
        },
        builder: (context, state) {
          return StreamBuilder<List<OrderInRoom>>(
            stream: orderConroller.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      state is OnlineLoading
                          ? const LinearProgressIndicator()
                          : Container(),
                      Column(
                        children: [
                          ListView.separated(
                            itemCount: snapshot.requireData.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: (context, index) {
                              final data = snapshot.requireData[index];
                              return OnlineOrderCard(
                                data: data,
                                onDelete: () =>
                                    controller.deleteOrder(data.order.id),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getInputs,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> getInputs() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.addOrderTitle),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              inputField(
                  controller: nameController,
                  hint: AppStrings.orderNameHintText),
              inputField(
                controller: priceController,
                hint: AppStrings.orderPriceHintText,
                type: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: clearInputs,
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: checkInputs,
            child: const Text(AppStrings.addOrderButtonText),
          ),
        ],
      ),
    );
  }

  Container inputField({
    required TextEditingController controller,
    required String hint,
    TextInputType? type,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.paddingAll),
      child: getInputField(
        controller: controller,
        hint: hint,
        type: type,
      ),
    );
  }

  TextField getInputField({
    required TextEditingController controller,
    required String hint,
    TextInputType? type,
  }) {
    return TextField(
      controller: controller,
      keyboardType: type ?? TextInputType.text,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }

  void checkInputs() {
    final name = nameController.text;
    final price = priceController.text;
    if (name.isNotEmpty && price.isNotEmpty) {
      controller.addOrder(name, double.parse(price));
      clearInputs();
    } else {
      AppConstants.showToast(message: AppStrings.invalidInputs);
    }
  }

  void clearInputs() {
    nameController.clear();
    priceController.clear();
    Navigator.pop(context);
  }
}
