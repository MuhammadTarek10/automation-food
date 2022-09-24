import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/features/online_food_order/domain/entities/order_in_room.dart';
import 'package:auto_food/features/online_food_order/presentation/bloc/online_food_order_bloc.dart';

class OnlineController {
  final OnlineFoodOrderBloc bloc;
  OnlineController({required this.bloc});

  final AppPreference appPreference = instance<AppPreference>();

  // room
  void getRooms() {
    bloc.add(GetRoomsEvent());
  }

  void getRoom(String roomId) {
    bloc.add(GetRoomEvent());
  }

  void goToRoom(String roomId) async {
    await appPreference.setRoomId(roomId);
  }

  void createRoom(
    String name,
    String code,
    int? number,
  ) {
    bloc.add(CreateRoomEvent(name: name, code: code, number: number));
  }

  void deleteRoom() {
    bloc.add(DeleteRoomEvent());
  }

  void joinRoom(String code){
    bloc.add(JoinRoomEvent(code: code));
  }

  void searchRoom(String code) {}

  // orders
  void addOrder(String name, double price) {
    bloc.add(AddOnlineOrderEvent(name: name, price: price));
  }

  void deleteOrder(String orderId) {
    bloc.add(DeleteOnlineOrderEvent(id: orderId));
  }

  void editOrder(String orderId) {}

  void getOrders() {
    bloc.add(GetRoomOrdersEvent());
  }

  void getConclusion(List<OrderInRoom> orders) {
    bloc.add(GetConclusionEvent(orders: orders));
  }

  void close() {
    bloc.close();
  }
}
