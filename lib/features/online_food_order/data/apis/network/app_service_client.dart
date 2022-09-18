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
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  // room

  // order
}
