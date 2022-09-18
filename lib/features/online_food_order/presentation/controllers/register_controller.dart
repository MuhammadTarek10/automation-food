import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/features/online_food_order/presentation/bloc/online_food_order_bloc.dart';

class RegsiterController {
  final AppPreference appPreference = instance<AppPreference>();

  final OnlineFoodOrderBloc bloc;
  RegsiterController({required this.bloc});

  void register(String name, String email, String password) {
    bloc.add(RegisterEvent(name: name, email: email, password: password));
  }

  void close() {
    bloc.close();
  }
}
