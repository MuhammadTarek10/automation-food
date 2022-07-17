import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/network/apis_routes.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/responses/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  // auth
  @POST(ApiRoutes.login)
  Future<RemoteAuthTokenResponse> login(@Body() LoginRequest loginRequest);
  @POST(ApiRoutes.register)
  Future<RemoteRegisterResponse> register(
      @Body() RegisterRequest registerRequest);

  // session
  @GET(ApiRoutes.getSessions)
  Future<List<RemoteSessionResponse>> getSessions();
  @POST(ApiRoutes.createSession)
  Future<RemoteSessionResponse> createSession(
      @Body() RemoteSessionRequest remoteSessionRequest);
  @POST(ApiRoutes.searchSession)
  Future<RemoteSessionResponse> searchSession(
      @Body() RemoteSessionRequest remoteSessionRequest);
  @DELETE(ApiRoutes.deleteSession)
  Future<RemoteSessionResponse> deleteSession(
      @Body() RemoteSessionDeleteRequest remoteSessionDeleteRequest);

  // order
  @GET(ApiRoutes.getOrders)
  Future<RemoteGetOrdersResponse> getOrders(String sessionId);
  @POST(ApiRoutes.addOrder)
  Future<RemoteOrderResponse> addOrder(
      @Body() RemoteOrderRequest remoteOrderRequest);
  @DELETE(ApiRoutes.deleteOrder)
  Future<RemoteOrderResponse> deleteOrder(
      @Body() RemoteOrderRequest remoteOrderRequest);
  @PUT(ApiRoutes.editOrder)
  Future<RemoteOrderResponse> editOrder(
      @Body() RemoteOrderRequest remoteOrderRequest);

  // conclusion
  @GET(ApiRoutes.getConclusion)
  Future<RemoteConclusionResponse> getConclusion(String sessionId);
}
