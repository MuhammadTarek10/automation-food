import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/food_order/data/models/order_model.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/widgets/confrimation_dialog.dart';
import 'package:auto_food/features/food_order/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  late final TextEditingController _nameController;
  late final TextEditingController _orderController;
  late final TextEditingController _priceController;
  late final TextEditingController _payedController;
  late final FoodOrderBloc foodBloc;

  @override
  void initState() {
    super.initState();
    foodBloc = BlocProvider.of<FoodOrderBloc>(context);
    _nameController = TextEditingController();
    _orderController = TextEditingController();
    _priceController = TextEditingController();
    _payedController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _orderController.dispose();
    _priceController.dispose();
    _payedController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => deleteAllOrders(context),
          ),
        ],
      ),
      body: BlocConsumer<FoodOrderBloc, FoodOrderState>(
          listener: (context, state) {
        if (state is FoodOrderInitial || state is AddingOrderSuccessState) {
          foodBloc.add(GetOrdersEvent());
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
                onDelete: (order) => deleteOrder(context, order),
                onEdit: (order) => editOrder(context, order),
                onDone: (order) => doneOrder(context, order),
              );
            },
          );
        } else {
          foodBloc.add(GetOrdersEvent());
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
                await takeInputsDialog(context, null);
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteOrder(BuildContext context, OrderModel order) async {
    if (await ConfirmationDialog.confirmDeleteOrder(context, order)) {
      foodBloc.add(DeleteOrderEvent(order: order));
    }
  }

  Future<void> editOrder(BuildContext context, OrderModel order) async {
    takeInputsDialog(context, order);
    foodBloc.add(UpdateOrderEvent(order: order));
  }

  Future<void> doneOrder(BuildContext context, OrderModel order) async {
    foodBloc.add(UpdateOrderDoneEvent(order: order));
  }

  Future<void> deleteAllOrders(BuildContext context) async {
    if (await ConfirmationDialog.confirmDeleteAll(context)) {
      foodBloc.add(DeleteAllOrdersEvent());
    }
  }

  Future<dynamic> takeInputsDialog(
      BuildContext context, OrderModel? order) async {
    _nameController.text = order?.name ?? '';
    _orderController.text = order?.order ?? '';
    _priceController.text = order?.price.toString() ?? '';
    _payedController.text = order?.payed.toString() ?? '';
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.enterOrderTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: AppStrings.nameHintText,
              ),
            ),
            TextField(
              controller: _orderController,
              decoration: const InputDecoration(
                labelText: AppStrings.orderHintText,
              ),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: AppStrings.priceHintText,
              ),
            ),
            TextField(
              controller: _payedController,
              decoration: const InputDecoration(
                labelText: AppStrings.payedHintText,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _clearInputs();
            },
            child: const Text(
              AppStrings.cancelOrderButtonText,
            ),
          ),
          TextButton(
            onPressed: () {
              if (_inputsValid()) {
                order == null
                    ? foodBloc.add(
                        AddOrderEvent(
                          name: _nameController.text,
                          order: _orderController.text,
                          price: double.parse(_priceController.text),
                          payed: double.parse(_payedController.text),
                          remaining: double.parse(_payedController.text) -
                              double.parse(_priceController.text),
                        ),
                      )
                    : foodBloc.add(
                        UpdateOrderEvent(
                          order: OrderModel(
                              id: order.id,
                              name: _nameController.text,
                              order: _orderController.text,
                              price: double.parse(_priceController.text),
                              payed: double.parse(_payedController.text),
                              remaining: double.parse(_payedController.text) -
                                  double.parse(_priceController.text),
                              done: order.done),
                        ),
                      );
                Navigator.of(context).pop();
              } else {
                AppConstants.showToast(message: AppStrings.invalidInputs);
              }
            },
            child: Text(
              order == null
                  ? AppStrings.addOrderButtonText
                  : AppStrings.saveOrderButtonText,
            ),
          ),
        ],
      ),
    );
  }

  bool _inputsValid() {
    try {
      double.parse(_priceController.text);
      double.parse(_payedController.text);
      if (_nameController.text.isEmpty ||
          _orderController.text.isEmpty ||
          _priceController.text.isEmpty ||
          _payedController.text.isEmpty) {
        return false;
      }
    } on Exception {
      return false;
    }
    return true;
  }

  void _clearInputs() {
    _nameController.clear();
    _orderController.clear();
    _priceController.clear();
    _payedController.clear();
  }
}
