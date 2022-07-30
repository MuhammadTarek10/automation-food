import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/data/models/local_order_model.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/widgets/confrimation_dialog.dart';
import 'package:flutter/material.dart';

class LocalOrderViewController {
  final FoodOrderBloc foodOrderBloc;

  const LocalOrderViewController({required this.foodOrderBloc});

  void getAllOrders() async {
    foodOrderBloc.add(GetOrdersEvent());
  }

  Future<void> deleteOrder(BuildContext context, LocalOrderModel order) async {
    if (await ConfirmationDialog.confirmDeleteOrder(context, order)) {
      foodOrderBloc.add(DeleteOrderEvent(order: order));
    }
  }

  Future<void> editOrder(
    BuildContext context,
    LocalOrderModel order,
    TextEditingController nameController,
    TextEditingController orderController,
    TextEditingController priceController,
    TextEditingController payedController,
  ) async {
    takeInputsDialog(context, order, nameController, orderController,
        priceController, payedController);
    foodOrderBloc.add(UpdateOrderEvent(order: order));
  }

  Future<void> doneOrder(LocalOrderModel order) async {
    foodOrderBloc.add(UpdateOrderDoneEvent(order: order));
  }

  Future<void> deleteAllOrders(BuildContext context) async {
    if (await ConfirmationDialog.confirmDeleteAll(context)) {
      foodOrderBloc.add(DeleteAllOrdersEvent());
    }
  }

  Future<dynamic> takeInputsDialog(
    BuildContext context,
    LocalOrderModel? order,
    TextEditingController? nameController,
    TextEditingController? orderController,
    TextEditingController? priceController,
    TextEditingController? payedController,
  ) async {
    nameController!.text = order?.name ?? '';
    orderController!.text = order?.order ?? '';
    priceController!.text = order?.price.toString() ?? '';
    payedController!.text = order?.payed.toString() ?? '';
    return getOrders(context, nameController, orderController, priceController,
        payedController, order);
  }

  Future<dynamic> getOrders(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController orderController,
      TextEditingController priceController,
      TextEditingController payedController,
      LocalOrderModel? order) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.enterOrderTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: AppStrings.nameHintText,
              ),
            ),
            TextField(
              controller: orderController,
              decoration: const InputDecoration(
                labelText: AppStrings.orderHintText,
              ),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: AppStrings.priceHintText,
              ),
            ),
            TextField(
              controller: payedController,
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
              foodOrderBloc.add(ClearAllInputsEvent());
            },
            child: const Text(
              AppStrings.cancelOrderButtonText,
            ),
          ),
          TextButton(
            onPressed: () {
              if (_inputsValid(nameController, orderController, priceController,
                  payedController)) {
                orderController.text.trim().contains(',')
                    ? foodOrderBloc.add(
                        AddGroupOrdersEvent(
                          name: nameController.text.trim(),
                          order: orderController.text.trim(),
                          price: priceController.text.trim(),
                          payed: payedController.text.trim(),
                        ),
                      )
                    : order == null
                        ? foodOrderBloc.add(
                            AddOrderEvent(
                              name: nameController.text.trim(),
                              order: orderController.text.trim(),
                              price: double.parse(priceController.text.trim()),
                              payed: double.parse(payedController.text.trim()),
                              remaining:
                                  double.parse(payedController.text.trim()) -
                                      double.parse(priceController.text.trim()),
                            ),
                          )
                        : foodOrderBloc.add(
                            UpdateOrderEvent(
                              order: LocalOrderModel(
                                id: order.id,
                                name: nameController.text.trim(),
                                order: orderController.text.trim(),
                                price:
                                    double.parse(priceController.text.trim()),
                                payed:
                                    double.parse(payedController.text.trim()),
                                remaining: double.parse(
                                        payedController.text.trim()) -
                                    double.parse(priceController.text.trim()),
                                done: order.done,
                              ),
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

  bool _inputsValid(
      TextEditingController? nameController,
      TextEditingController? orderController,
      TextEditingController? priceController,
      TextEditingController? payedController) {
    try {
      double.parse(priceController!.text);
      double.parse(payedController!.text);
      if (nameController!.text.isEmpty ||
          orderController!.text.isEmpty ||
          priceController.text.trim().isEmpty ||
          payedController.text.trim().isEmpty) {
        return false;
      }
    } catch (error) {
      if (priceController!.text.contains(',') &&
          payedController!.text.contains(',')) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }
}
