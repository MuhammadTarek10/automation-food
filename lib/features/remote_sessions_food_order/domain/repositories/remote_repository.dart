import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_conclusion_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_order_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_session_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteRepository {
  // auth
  Future<Either<Failure, String>> login(LoginRequest loginRequest);
  Future<Either<Failure, RemoteUserModel>> register(
      RegisterRequest registerRequest);

  // session
  Future<Either<Failure, List<RemoteSessionModel>>> getSessions();
  Future<Either<Failure, RemoteSessionModel>> createSession(
      RemoteSessionRequest remoteSessionRequest);
  Future<Either<Failure, RemoteSessionModel>> searchSession(
      RemoteSessionRequest remoteSessionRequest);
  Future<Either<Failure, RemoteSessionModel>> deleteSession(
      RemoteSessionRequest remoteSessionRequest);

  // order
  Future<Either<Failure, List<RemoteGetOrderInSessionModel>>> getOrders(
      String sessionId);
  Future<Either<Failure, RemoteOrderModel>> addOrder(
      RemoteOrderRequest remoteOrderRequest);
  Future<Either<Failure, RemoteOrderModel>> deleteOrder(
      RemoteOrderRequest remoteOrderRequest);
  Future<Either<Failure, RemoteOrderModel>> editOrder(
      RemoteOrderRequest remoteOrderRequest);

  // conclusion
  Future<Either<Failure, RemoteConclusionModel>> getConclusion(
      String sessionId);
}
