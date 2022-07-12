import 'package:auto_food/features/food_order/data/models/conclusion_model.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/widgets/conclusion_card.dart';
import 'package:flutter/material.dart';

class ConclusionViewController {
  final FoodOrderBloc foodOrderBloc;

  const ConclusionViewController({required this.foodOrderBloc});

  void getConclusion() {
    foodOrderBloc.add(GetConclusionEvent());
  }

  Widget buildConclusion(ConclusionModel conclusion) {
    return ConclusionCard(conclusion: conclusion);
  }
}
