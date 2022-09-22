import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/data/datasources/local_data_source.dart';
import 'package:auto_food/features/food_order/data/models/local_order_model.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/food_order/presentation/widgets/confrimation_dialog.dart';
import 'package:flutter/material.dart';

class LocalOrderViewController {
  final FoodOrderBloc foodOrderBloc;

  LocalOrderViewController({required this.foodOrderBloc});

  final LocalDataSource dataSource = instance<LocalDataSource>();

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
    LocalOrderModel? order,
  ) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.enterOrderTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: AppPadding.paddingAll),
              child: getInputField(nameController, AppStrings.nameHintText),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppPadding.paddingAll),
              child: getOrderSuggestions(orderController, priceController),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: AppPadding.paddingAll),
              child: getInputField(priceController, AppStrings.priceHintText),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: AppPadding.paddingAll),
              child: getInputField(payedController, AppStrings.payedHintText),
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
              AppStrings.cancel,
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

  TextField getInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }

  Autocomplete<LocalOrderModel> getOrderSuggestions(
    TextEditingController orderController,
    TextEditingController priceController,
  ) {
    return Autocomplete<LocalOrderModel>(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        orderController.text = textEditingValue.text;

        if (textEditingValue.text.isEmpty) {
          return List.empty();
        } else {
          return await dataSource.getSuggestionsOrders(textEditingValue.text);
        }
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: AppStrings.orderHintText,
          ),
        );
      },
      optionsViewBuilder: (
        BuildContext context,
        Function onSelected,
        Iterable<LocalOrderModel> options,
      ) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              margin: EdgeInsets.only(right: constraints.maxWidth * 0.45),
              child: Material(
                elevation: AppPadding.paddingAll,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListView.separated(
                  itemCount: options.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final LocalOrderModel order = options.elementAt(index);
                    return ListTile(
                      title: Text(order.order),
                      subtitle: Text(order.price.toString()),
                      onTap: () => onSelected(order),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
      onSelected: (option) {
        orderController.text = option.order;
        priceController.text = option.price.toString();
      },
      displayStringForOption: (option) => option.order,
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
