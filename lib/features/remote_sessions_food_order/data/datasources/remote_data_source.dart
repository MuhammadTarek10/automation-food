import 'package:auto_food/features/remote_sessions_food_order/data/apis/network/remote_app_api.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/responses/responses.dart';

abstract class RemoteDataSource {
  Future<RemoteAuthTokenResponse> login(LoginRequest loginRequest);
  Future<RemoteRegisterResponse> register(RegisterRequest registerRequest);
  Future<List<RemoteSessionResponse>> getSessions();
  Future<RemoteSessionResponse> createSession(
      RemoteSessionRequest remoteSessionRequest);
  Future<RemoteSessionResponse> searchSession(
      RemoteSessionRequest remoteSessionRequest);
  Future<RemoteSessionResponse> deleteSession(
      RemoteSessionRequest remoteSessionRequest);
  Future<RemoteGetOrdersResponse> getOrders(String sessionId);
  Future<RemoteOrderResponse> addOrder(RemoteOrderRequest remoteOrderRequest);
  Future<RemoteOrderResponse> deleteOrder(
      RemoteOrderRequest remoteOrderRequest);
  Future<RemoteOrderResponse> editOrder(RemoteOrderRequest remoteOrderRequest);
  Future<RemoteConclusionResponse> getConclusion(String sessionId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient appServiceClient;
  const RemoteDataSourceImpl({required this.appServiceClient});

  // auth
  @override
  Future<RemoteAuthTokenResponse> login(LoginRequest loginRequest) async {
    return await appServiceClient.login(loginRequest);
  }

  @override
  Future<RemoteRegisterResponse> register(
      RegisterRequest registerRequest) async {
    return await appServiceClient.register(registerRequest);
  }

  // session
  @override
  Future<List<RemoteSessionResponse>> getSessions() async {
    return await appServiceClient.getSessions();
  }

  @override
  Future<RemoteSessionResponse> createSession(
      RemoteSessionRequest remoteSessionRequest) async {
    return await appServiceClient.createSession(remoteSessionRequest);
  }

  @override
  Future<RemoteSessionResponse> searchSession(
      RemoteSessionRequest remoteSessionRequest) async {
    return await appServiceClient.searchSession(remoteSessionRequest);
  }

  @override
  Future<RemoteSessionResponse> deleteSession(
      RemoteSessionRequest remoteSessionRequest) async {
    return await appServiceClient.deleteSession(remoteSessionRequest);
  }

  // order
  @override
  Future<RemoteGetOrdersResponse> getOrders(String sessionId) async {
    return await appServiceClient.getOrders(sessionId);
  }

  @override
  Future<RemoteOrderResponse> addOrder(
      RemoteOrderRequest remoteOrderRequest) async {
    return await appServiceClient.addOrder(remoteOrderRequest);
  }

  @override
  Future<RemoteOrderResponse> deleteOrder(
      RemoteOrderRequest remoteOrderRequest) async {
    return await appServiceClient.deleteOrder(remoteOrderRequest);
  }

  @override
  Future<RemoteOrderResponse> editOrder(
      RemoteOrderRequest remoteOrderRequest) async {
    return await appServiceClient.editOrder(remoteOrderRequest);
  }

  // conclusion
  @override
  Future<RemoteConclusionResponse> getConclusion(String sessionId) async {
    return await appServiceClient.getConclusion(sessionId);
  }
}
