import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/views/local_conclusion_view.dart';
import 'package:auto_food/features/food_order/presentation/views/local_order_view.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/bloc/remote_sessions_food_order_bloc.dart';
import 'package:auto_food/core/home_view.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/views/login_view.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/views/register_view.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/views/remote_session_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String initalHomeRoute = "/";

  // local
  static const String localOrderRoute = "/orders";
  static const String localConclusionRoute = '/conclusion';

  // remote
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String remoteSessionRoute = "/remote-session";
  static const String remoteConclusionRoute = '/remote-conclusion';

  static const String undefined = '/undefined';
}

class AppRouterGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initalHomeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case Routes.localOrderRoute:
        initLocal();
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<FoodOrderBloc>(),
            child: const LocalOrderView(),
          ),
        );
      case Routes.localConclusionRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<FoodOrderBloc>(),
            child: const LocalConclusionView(),
          ),
        );
      case Routes.loginRoute:
        initRemote();
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<RemoteSessionsFoodOrderBloc>(),
            child: const LoginView(),
          ),
        );
      case Routes.registerRoute:
        initRemote();
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<RemoteSessionsFoodOrderBloc>(),
            child: const RegisterView(),
          ),
        );
      case Routes.remoteSessionRoute:
        initRemote();
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<RemoteSessionsFoodOrderBloc>(),
            child: const RemoteSessionView(),
          ),
        );
      default:
        return undefined();
    }
  }

  static Route<dynamic> undefined() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.undefinedRoute),
        ),
      ),
    );
  }
}
