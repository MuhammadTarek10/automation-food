import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/bloc/remote_sessions_food_order_bloc.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/controllers/auth_controller.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/controllers/remote_session_controller.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/widgets/session_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteSessionHomeView extends StatefulWidget {
  const RemoteSessionHomeView({Key? key}) : super(key: key);

  @override
  State<RemoteSessionHomeView> createState() => _RemoteSessionHomeViewState();
}

class _RemoteSessionHomeViewState extends State<RemoteSessionHomeView> {
  late final RemoteSessionController _controller;
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();
    _controller = RemoteSessionController(
        bloc: BlocProvider.of<RemoteSessionsFoodOrderBloc>(context));
    _authController = AuthController(
        bloc: BlocProvider.of<RemoteSessionsFoodOrderBloc>(context));
    _controller.getSessions();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => _controller.getSessions(),
      child: BlocConsumer<RemoteSessionsFoodOrderBloc,
          RemoteSessionsFoodOrderState>(
        listener: (context, state) {
          if (state is RemoteSessionsFoodOrderInitial) {
            _controller.getSessions();
          } else if (state is SessionFaildShouldLoggout) {
            _authController.loggout();
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.loginRoute,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                AppStrings.remoteSessionTitle,
              ),
            ),
            body: (state is GetSessionsSuccessfully)
                ? SessionCard(
                    sessions: state.sessions,
                    onDelete: (session) =>
                        _controller.deleteSession(session.id),
                  )
                : _loading(),
          );
        },
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
