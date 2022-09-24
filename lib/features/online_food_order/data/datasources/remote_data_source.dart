import 'package:auto_food/features/online_food_order/data/apis/network/app_service_client.dart';
import 'package:auto_food/features/online_food_order/data/apis/requrests/requests.dart';
import 'package:auto_food/features/online_food_order/data/apis/responses/responses.dart';
import 'package:auto_food/features/online_food_order/data/datasources/online_data_source.dart';

class RemoteDataSource implements OnlineDataSource {
  final AppServiceClient appServiceClient;
  const RemoteDataSource({required this.appServiceClient});
  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await appServiceClient.login(request);
  }

  @override
  Future<UserResponse> register(RegisterRequest request) async {
    return await appServiceClient.register(request);
  }

  @override
  Future<GetRoomsResponse> getRooms(String id) async {
    return await appServiceClient.getRooms(id);
  }

  @override
  Future<OrderInRoomResponse> getOrders(String id, String roomId) async {
    return await appServiceClient.getOrders(id, roomId);
  }

  @override
  Future<RoomResponse> createRoom(String id, CreateRoomRequest request) async {
    return await appServiceClient.createRoom(id, request);
  }

  @override
  Future<void> addOrder(String id, AddOrderRequest request) async {
    await appServiceClient.addOrder(id, request);
  }

  @override
  Future<void> deleteOrder(String id, String userId) async {
    await appServiceClient.deleteOrder(id, userId);
  }

  @override
  Future<RoomResponse> getRoom(String roomId) async {
    return await appServiceClient.getRoom(roomId);
  }

  @override
  Future<void> deleteRoom(String id, String roomId) async {
    await appServiceClient.deleteRoom(id, roomId);
  }

  @override
  Future<RoomResponse> joinRoom(String id, JoinRoomRequest request) async {
    return await appServiceClient.joinRoom(id, request);
  }
}
