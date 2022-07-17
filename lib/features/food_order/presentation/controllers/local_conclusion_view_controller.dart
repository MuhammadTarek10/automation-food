import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/widgets/conclusion_by_order_card.dart';
import 'package:auto_food/features/food_order/presentation/widgets/conclusion_by_user_card.dart';
import 'package:flutter/material.dart';

class LocalConclusionViewController {
  final FoodOrderBloc foodOrderBloc;

  const LocalConclusionViewController({required this.foodOrderBloc});

  void getConclusionByOrder() {
    foodOrderBloc.add(GetConclusionByOrderEvent());
  }

  void getConclusionByUser() {
    foodOrderBloc.add(GetConclusionByUserEvent());
  }

  Widget buildConclusionByOrder(LocalConclusionOrderModel conclusion) {
    return ConclusionByOrderCard(conclusion: conclusion);
  }

  Widget buildConclusionByUser(LocalConclusionUserModel conclusion) {
    return ConclusionByUserCard(conclusion: conclusion);
  }
}
