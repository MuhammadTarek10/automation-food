import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/controllers/order_view_controller.dart';
import 'package:auto_food/features/food_order/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  late final TextEditingController nameController;
  late final TextEditingController orderController;
  late final TextEditingController priceController;
  late final TextEditingController payedController;
  late final OrderViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OrderViewController(
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
          return ListView.builder(
            itemCount: orders.length,
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
        } else {
          _controller.getAllOrders();
          return const Center(child: CircularProgressIndicator());
        }
      }),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          left: context.width *
              AppSizes.floatingAcitonButtonsPaddingLeftPrecentage,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: AppStrings.addOrderFloatingActionButtonTag,
              backgroundColor: AppColors.primary,
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.conclusionRoute);
              },
              child: const Icon(Icons.add_chart),
            ),
            FloatingActionButton(
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
          ],
        ),
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
