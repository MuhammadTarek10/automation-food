import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/data/models/conclusion_model.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/widgets/conclusion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConclusionView extends StatefulWidget {
  const ConclusionView({Key? key}) : super(key: key);

  @override
  State<ConclusionView> createState() => _ConclusionViewState();
}

class _ConclusionViewState extends State<ConclusionView> {
  late FoodOrderBloc foodOrderBloc;
  late ConclusionModel conclusion;

  @override
  void initState() {
    super.initState();
    foodOrderBloc = BlocProvider.of<FoodOrderBloc>(context);
    foodOrderBloc.add(GoToConclusionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodOrderBloc, FoodOrderState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.conclusionTitle),
          ),
          body: state is ConclusionLoadedState
              ? _buildConclusion(state)
              : _buildLoading(),
        );
      },
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildConclusion(ConclusionLoadedState state) {
    conclusion = state.conclusion;
    return ConclusionCard(conclusion: conclusion);
  }
}
