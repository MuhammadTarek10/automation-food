import 'package:auto_food/features/online_food_order/data/apis/network/app_service_client.dart';
import 'package:auto_food/features/online_food_order/data/apis/responses/responses.dart';
import 'package:auto_food/features/online_food_order/data/apis/requrests/requests.dart';
import 'package:auto_food/features/online_food_order/data/datasources/online_data_source.dart';

class RemoteDataSource implements OnlineDataSource {
  final AppServiceClient appServiceClient;
  const RemoteDataSource({required this.appServiceClient});
  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await appServiceClient.login(request);
  }
}
