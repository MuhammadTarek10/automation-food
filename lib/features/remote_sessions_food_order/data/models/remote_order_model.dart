class RemoteOrderModel {
  const RemoteOrderModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.price,
    required this.sessionId,
    required this.done,
  });

  final String id;
  final String userId;
  final String name;
  final double price;
  final String sessionId;
  final bool done;
}
