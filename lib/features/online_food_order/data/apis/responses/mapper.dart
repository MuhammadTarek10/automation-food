import 'package:auto_food/features/online_food_order/data/apis/responses/responses.dart';
import 'package:auto_food/features/online_food_order/data/models/online_order.dart';
import 'package:auto_food/features/online_food_order/data/models/online_room.dart';
import 'package:auto_food/features/online_food_order/data/models/order_in_room.dart';
import 'package:auto_food/features/online_food_order/data/models/user.dart';

extension LoginResponseExtension on LoginResponse {
  UserModel toModel() {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
    );
  }
}

extension RegisterResposneExtension on UserResponse {
  UserModel toModel() {
    return UserModel(
      id: id,
      name: name,
      email: email,
    );
  }
}

extension GetRoomsResponseExtension on GetRoomsResponse {
  List<OnlineRoomModel> toModel() {
    return rooms.map((room) => room.toModel()).toList();
  }
}

extension RoomResponseExtension on RoomResponse {
  OnlineRoomModel toModel() {
    return OnlineRoomModel(
      id: id,
      adminId: adminId,
      name: name,
      code: code,
      number: number,
    );
  }
}

extension OrderResponseExtension on OrderResponse {
  OnlineOrderModel toModel() {
    return OnlineOrderModel(
      id: id,
      userId: userId,
      name: name,
      price: price,
      roomId: roomId,
      done: done,
    );
  }
}

extension OrderInRoomSingleResponseExtension on OrderInRoomSingleResponse {
  OrderInRoomModel toModel() {
    return OrderInRoomModel(
      order: order.toModel(),
      user: user.toModel(),
    );
  }
}

extension OrderInRoomResponseExtension on OrderInRoomResponse {
  List<OrderInRoomModel> toModel() {
    return data.map((e) => e.toModel()).toList();
  }
}
