import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/data/models/local_order_model.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog {
  static Future<dynamic> confirmDeleteOrder(
      BuildContext context, LocalOrderModel order) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.deleteOrderTitle),
        content: const Text(AppStrings.deleteOrderContent),
        actions: [
          TextButton(
            child: const Text(AppStrings.cancel),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: const Text(AppStrings.deleteOrderButtonText),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
  }

  static Future<dynamic> confirmDeleteAll(BuildContext context) {
    return CoolAlert.show(
      context: context,
      title: AppStrings.deleteAllOrdersTitle,
      type: CoolAlertType.confirm,
      onConfirmBtnTap: () => Navigator.pop(context, true),
      onCancelBtnTap: () => Navigator.pop(context, false),
      confirmBtnColor: AppColors.primary,
    );
  }
}
