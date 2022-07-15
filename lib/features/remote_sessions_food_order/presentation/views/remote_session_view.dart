import 'dart:developer';

import 'package:auto_food/features/remote_sessions_food_order/presentation/bloc/remote_sessions_food_order_bloc.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/controllers/remote_session_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteSessionView extends StatefulWidget {
  const RemoteSessionView({Key? key}) : super(key: key);

  @override
  State<RemoteSessionView> createState() => _RemoteSessionViewState();
}

class _RemoteSessionViewState extends State<RemoteSessionView> {
  late final RemoteSessionController _controller;

  @override
  void initState() {
    super.initState();
    _controller = RemoteSessionController(
        bloc: BlocProvider.of<RemoteSessionsFoodOrderBloc>(context));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => log("ASD"),
        child: const Text("Test"),
      ),
    );
  }
}
