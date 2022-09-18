import 'package:auto_food/features/online_food_order/data/apis/requrests/requests.dart';
import 'package:auto_food/features/online_food_order/data/apis/responses/responses.dart';

abstract class OnlineDataSource {
  Future<LoginResponse> login(LoginRequest request);
}
