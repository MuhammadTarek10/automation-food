import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/repositories/remote_repository.dart';
import 'package:flutter/material.dart';

class RemoteSessionView extends StatefulWidget {
  const RemoteSessionView({Key? key}) : super(key: key);

  @override
  State<RemoteSessionView> createState() => _RemoteSessionViewState();
}

class _RemoteSessionViewState extends State<RemoteSessionView> {
  final RemoteRepository remoteRespositoryImpl = instance<RemoteRepository>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {},
        child: const Text("Test"),
      ),
    );
  }
}
