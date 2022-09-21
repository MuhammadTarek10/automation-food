import 'package:auto_food/features/online_food_order/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class OnlineRoom extends Equatable {
  final String id;
  final String adminId;
  final User admin;
  final String name;
  final String code;
  final int number;
  final List<User> users;

  const OnlineRoom({
    required this.id,
    required this.adminId,
    required this.admin,
    required this.name,
    required this.code,
    required this.number,
    required this.users,
  });

  @override
  List<Object?> get props => [
        id,
        adminId,
        admin,
        name,
        code,
        number,
        users,
      ];
}
