import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/views/local_conclusion_view.dart';
import 'package:auto_food/features/food_order/presentation/views/local_order_view.dart';
import 'package:auto_food/core/home_view.dart';
import 'package:auto_food/features/online_food_order/domain/entities/room.dart';
import 'package:auto_food/features/online_food_order/presentation/bloc/online_food_order_bloc.dart';
import 'package:auto_food/features/online_food_order/presentation/views/auth/login_view.dart';
import 'package:auto_food/features/online_food_order/presentation/views/auth/register_view.dart';
import 'package:auto_food/features/online_food_order/presentation/views/room/room_details.dart';
import 'package:auto_food/features/online_food_order/presentation/views/room/rooms_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String initalHomeRoute = "/";

  // local
  static const String localOrderRoute = "/orders";
  static const String localConclusionRoute = '/conclusion';

  // remote
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String roomRoute = "/room";
  static const String roomDetails = "/room-details";
  static const String remoteConclusionRoute = '/remote-conclusion';

  static const String undefined = '/undefined';
}

class AppRouterGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initalHomeRoute:
        initLocal();
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case AppRoutes.localOrderRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<FoodOrderBloc>(),
            child: const LocalOrderView(),
          ),
        );
      case AppRoutes.localConclusionRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<FoodOrderBloc>(),
            child: const LocalConclusionView(),
          ),
        );
      case AppRoutes.loginRoute:
        initRemote();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<OnlineFoodOrderBloc>(),
            child: const LoginView(),
          ),
        );
      case AppRoutes.registerRoute:
        initRemote();

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<OnlineFoodOrderBloc>(),
            child: const RegisterView(),
          ),
        );
      case AppRoutes.roomRoute:
        initRemote();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                instance<OnlineFoodOrderBloc>()..add(GetRoomsEvent()),
            child: const RoomsView(),
          ),
        );
      case AppRoutes.roomDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                instance<OnlineFoodOrderBloc>()..add(GetRoomOrdersEvent()),
            child: RoomDetails(room: settings.arguments as OnlineRoom),
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
