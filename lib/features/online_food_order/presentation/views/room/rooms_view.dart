import 'dart:async';

import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/utils/app_constants.dart';
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
  final OnlineController controller = instance<OnlineController>();

  late final StreamController<List<OnlineRoom>> roomsController;

  @override
  void initState() {
    super.initState();
    roomsController = StreamController<List<OnlineRoom>>();
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
      ),
      body: RefreshIndicator(
        onRefresh: () async => controller.getRooms(),
        child: BlocListener<OnlineFoodOrderBloc, OnlineFoodOrderState>(
          listener: (context, state) {
            if (state is GetRoomsSuccessState) {
              roomsController.add(state.rooms);
            } else if (state is OnlineLoading) {
              AppConstants.showSnackBar(
                context: context,
                message: AppStrings.loading,
              );
            }
          },
          child: StreamBuilder<List<OnlineRoom>>(
            stream: roomsController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(height: context.height * 0.04),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
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
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
