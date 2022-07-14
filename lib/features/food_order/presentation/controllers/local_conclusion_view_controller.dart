import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/widgets/conclusion_card.dart';
import 'package:flutter/material.dart';

class LocalConclusionViewController {
  final FoodOrderBloc foodOrderBloc;

  const LocalConclusionViewController({required this.foodOrderBloc});

  void getConclusion() {
    foodOrderBloc.add(GetConclusionEvent());
  }

  Widget buildConclusion(LocalConclusionModel conclusion) {
    return ConclusionCard(conclusion: conclusion);
  }
}
