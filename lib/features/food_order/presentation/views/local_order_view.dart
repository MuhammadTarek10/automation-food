import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/controllers/local_order_view_controller.dart';
import 'package:auto_food/features/food_order/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalOrderView extends StatefulWidget {
  const LocalOrderView({Key? key}) : super(key: key);

  @override
  State<LocalOrderView> createState() => _LocalOrderViewState();
}

class _LocalOrderViewState extends State<LocalOrderView> {
  late final TextEditingController nameController;
  late final TextEditingController orderController;
  late final TextEditingController priceController;
  late final TextEditingController payedController;
  late final LocalOrderViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LocalOrderViewController(
        foodOrderBloc: BlocProvider.of<FoodOrderBloc>(context));
    nameController = TextEditingController();
    orderController = TextEditingController();
    priceController = TextEditingController();
    payedController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    orderController.dispose();
    priceController.dispose();
    payedController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _controller.deleteAllOrders(context),
          ),
          IconButton(
            icon: const Icon(Icons.insights),
            onPressed: () =>
                Navigator.pushNamed(context, Routes.localConclusionRoute),
          ),
        ],
      ),
      body: BlocConsumer<FoodOrderBloc, FoodOrderState>(
          listener: (context, state) {
        if (state is FoodOrderInitial || state is AddingOrderSuccessState) {
          _controller.getAllOrders();
        } else if (state is ClearAllInputsState) {
          _clearInputs();
        }
      }, builder: (context, state) {
        if (state is DataLoadedState) {
          final orders = state.orders
            ..sort((a, b) => b.remaining.compareTo(a.remaining));
          return ListView.separated(
            itemCount: orders.length,
            separatorBuilder: (context, index) => Divider(
              thickness: context.height * AppSizes.dividerBetweenOrderCards,
              color: Colors.grey,
            ),
            itemBuilder: (context, index) {
              final order = orders[index];
              return OrderCard(
                order: order,
                onDelete: (order) => _controller.deleteOrder(context, order),
                onEdit: (order) => _controller.editOrder(
                  context,
                  order,
                  nameController,
                  orderController,
                  priceController,
                  payedController,
                ),
                onDone: (order) => _controller.doneOrder(order),
              );
            },
          );
        } else if (state is DataEmptyState) {
          return const Center(child: Text(AppStrings.emptyOrdersText));
        } else {
          _controller.getAllOrders();
          return const Center(child: CircularProgressIndicator());
        }
      }),
      floatingActionButton: FloatingActionButton(
        heroTag: AppStrings.getConclusionFloatingActionButtonTag,
        backgroundColor: AppColors.primary,
        onPressed: () async {
          await _controller.takeInputsDialog(
            context,
            null,
            nameController,
            orderController,
            priceController,
            payedController,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _clearInputs() {
    nameController.clear();
    orderController.clear();
    priceController.clear();
    payedController.clear();
  }
}
