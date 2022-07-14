import 'package:auto_food/features/remote_sessions_food_order/data/apis/responses/responses.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_conclusion_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_login_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_order_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_session_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/user_model.dart';

extension LoginResponseExtension on RemoteLoginResponse {
  RemoteLoginModel toModel() {
    return RemoteLoginModel(token: token);
  }
}

extension RegsiterResponseExtension on RemoteRegisterResponse {
  UserModel toModel() {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
      isAdmin: user.isAdmin,
    );
  }
}

extension SessionResponseExtension on RemoteSessionResponse {
  RemoteSessionModel toModel() {
    return RemoteSessionModel(
      id: id,
      name: name,
      userId: userId,
      code: code,
      number: number,
    );
  }
}

extension RemoteOrderResponseExtension on RemoteOrderResponse {
  RemoteOrderModel toModel() {
    return RemoteOrderModel(
        id: id,
        userId: userId,
        sessionId: sessionId,
        name: name,
        price: price,
        done: done);
  }
}

extension RemoteConclusionResponseExtension on RemoteConclusionResponse {
  RemoteConclusionModel toModel() {
    return RemoteConclusionModel(
      id: id,
      userId: userId,
      sessionId: sessionId,
      total: total,
      orders: orders.map((order) => order.toModel()).toList(),
    );
  }
}
