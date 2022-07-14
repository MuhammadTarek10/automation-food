import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_order_model.dart';

class RemoteConclusionModel {
  const RemoteConclusionModel({
    required this.id,
    required this.userId,
    required this.sessionId,
    required this.total,
    required this.orders,
  });

  final String id;
  final String userId;
  final String sessionId;
  final double total;
  final List<RemoteOrderModel> orders;
}
