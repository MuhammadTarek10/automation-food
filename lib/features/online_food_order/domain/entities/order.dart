import 'package:equatable/equatable.dart';

class OnlineOrder extends Equatable {
  final String id;
  final String userId;
  final String roomId;
  final String name;
  final double price;
  final bool done;

  const OnlineOrder({
    required this.id,
    required this.userId,
    required this.roomId,
    required this.name,
    required this.price,
    required this.done,
  });
  @override
  List<Object?> get props => [id, userId, roomId, name, price, done];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnlineOrder && name == other.name && price == other.price;

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}
