
import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/features/online_food_order/presentation/bloc/online_food_order_bloc.dart';

class OnlineController {
  final OnlineFoodOrderBloc bloc;
  OnlineController({required this.bloc});

  final AppPreference appPreference = instance<AppPreference>();

  void getRooms() {
    bloc.add(GetRoomsEvent());
  }

  void goToRoom(String roomId) async {
    await appPreference.setRoomId(roomId);
  }

  void close() {
    bloc.close();
  }
}
