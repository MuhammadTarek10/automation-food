import 'package:auto_food/features/online_food_order/data/apis/requrests/requests.dart';
import 'package:auto_food/features/online_food_order/data/apis/responses/responses.dart';

abstract class OnlineDataSource {
  Future<LoginResponse> login(LoginRequest request);
  Future<UserResponse> register(RegisterRequest request);
  Future<GetRoomsResponse> getRooms(String id);
  Future<OrderInRoomResponse> getOrders(String id, String roomId);
  Future<void> createRoom(String id, CreateRoomRequest request);
  Future<void> addOrder(String id, AddOrderRequest request);
  Future<void> deleteOrder(String id, String userId);
  Future<RoomResponse> getRoom(String roomId);
  Future<void> deleteRoom(String id, String roomId);
  Future<RoomResponse> joinRoom(String id, JoinRoomRequest request);
}
