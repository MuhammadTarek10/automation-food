import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/features/online_food_order/data/apis/network/api_routes.dart';
import 'package:auto_food/features/online_food_order/data/apis/requrests/requests.dart';
import 'package:auto_food/features/online_food_order/data/apis/responses/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_service_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  // auth
  @POST(ApiRoutes.login)
  Future<LoginResponse> login(@Body() LoginRequest request);
  @POST(ApiRoutes.register)
  Future<UserResponse> register(@Body() RegisterRequest request);

  // room
  @GET(ApiRoutes.getRooms)
  Future<GetRoomsResponse> getRooms(@Path("id") String id);

  // order
  @GET(ApiRoutes.getOrders)
  Future<OrderInRoomResponse> getOrders(
      @Path("id") String id, @Path("room_id") String roomId);

  @POST(ApiRoutes.createRoom)
  Future<RoomResponse> createRoom(
      @Path("id") String id, @Body() CreateRoomRequest request);

  @POST(ApiRoutes.addOrder)
  Future<OrderResponse> addOrder(
      @Path("id") String id, @Body() AddOrderRequest request);

  @DELETE(ApiRoutes.deleteOrder)
  Future<OrderResponse> deleteOrder(
      @Path("id") String id, @Path("user_id") String userId);

  @GET(ApiRoutes.getRoom)
  Future<RoomResponse> getRoom(@Path("room_id") String roomId);

  @DELETE(ApiRoutes.deleteRoom)
  Future<void> deleteRoom(
      @Path("id") String id, @Path("room_id") String roomId);
}
