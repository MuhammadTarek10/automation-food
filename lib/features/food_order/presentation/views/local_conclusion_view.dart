import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/controllers/local_conclusion_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalConclusionView extends StatefulWidget {
  const LocalConclusionView({Key? key}) : super(key: key);

  @override
  State<LocalConclusionView> createState() => _LocalConclusionViewState();
}

class _LocalConclusionViewState extends State<LocalConclusionView> {
  late LocalConclusionViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LocalConclusionViewController(
        foodOrderBloc: BlocProvider.of<FoodOrderBloc>(context));
    _controller.getConclusion();
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
              ? _controller.buildConclusion(state.conclusion)
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
}
