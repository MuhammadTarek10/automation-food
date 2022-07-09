import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/views/conclusion_view.dart';
import 'package:auto_food/features/food_order/presentation/views/order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String orderRoute = '/';
  static const String conclusionRoute = '/conclusion';

  static const String undefined = '/undefined';
}

class AppRouterGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.orderRoute:
        initOrder();
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<FoodOrderBloc>(),
            child: const OrderView(),
          ),
        );
      case Routes.conclusionRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<FoodOrderBloc>(),
            child: const ConclusionView(),
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
