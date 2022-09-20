import 'dart:async';

import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/online_food_order/domain/entities/room.dart';
import 'package:auto_food/features/online_food_order/presentation/bloc/online_food_order_bloc.dart';
import 'package:auto_food/features/online_food_order/presentation/controllers/online_controller.dart';
import 'package:auto_food/features/online_food_order/presentation/widgets/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsView extends StatefulWidget {
  const RoomsView({Key? key}) : super(key: key);

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {
  late final OnlineController controller;

  late final StreamController<List<OnlineRoom>> roomsController;
  late final TextEditingController nameController;
  late final TextEditingController codeController;
  late final TextEditingController numberController;

  @override
  void initState() {
    super.initState();
    roomsController = StreamController<List<OnlineRoom>>();
    controller = OnlineController(bloc: context.read<OnlineFoodOrderBloc>());
    nameController = TextEditingController();
    codeController = TextEditingController();
    numberController = TextEditingController();
  }

  @override
  void dispose() {
    controller.close();
    roomsController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.roomViewTitle),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => controller.getRooms(),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => controller.getRooms(),
        child: BlocConsumer<OnlineFoodOrderBloc, OnlineFoodOrderState>(
          listener: (context, state) {
            if (state is GetRoomsSuccessState) {
              roomsController.add(state.rooms);
            } else if (state is GenericSuccessState) {
              controller.getRooms();
            }
          },
          builder: (cotnext, state) => StreamBuilder<List<OnlineRoom>>(
            stream: roomsController.stream,
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
                          SizedBox(height: context.height * 0.04),
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.requireData.length,
                            itemBuilder: (context, index) {
                              final room = snapshot.requireData[index];
                              return Room(
                                room: room,
                                onTap: () async {
                                  controller.goToRoom(room.id);
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.roomDetails,
                                    arguments: room,
                                  );
                                },
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
          ),
        ),
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
        title: const Text(AppStrings.enterRoomDetailsTitle),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              inputField(
                controller: nameController,
                hint: AppStrings.roomNameHintText,
              ),
              inputField(
                controller: codeController,
                hint: AppStrings.roomCodeHintText,
              ),
              inputField(
                controller: numberController,
                hint: AppStrings.roomNumberHintText,
                type: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: clearInputs,
            child: const Text(AppStrings.cancelOrderButtonText),
          ),
          TextButton(
            onPressed: checkInputs,
            child: const Text(AppStrings.createRoomButton),
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
    final code = codeController.text;
    final number =
        numberController.text.isNotEmpty ? int.parse(numberController.text) : 1;
    if (name.isNotEmpty && code.isNotEmpty) {
      controller.createRoom(name, code, number);
      clearInputs();
    } else {
      AppConstants.showToast(message: AppStrings.invalidInputs);
    }
  }

  void clearInputs() {
    nameController.clear();
    codeController.clear();
    numberController.clear();
    Navigator.pop(context);
  }
}
