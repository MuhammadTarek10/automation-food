import 'package:equatable/equatable.dart';

class OnlineRoom extends Equatable {
  final String id;
  final String adminId;
  final String name;
  final String code;
  final int number;

  const OnlineRoom({
    required this.id,
    required this.adminId,
    required this.name,
    required this.code,
    required this.number,
  });

  @override
  List<Object?> get props => [
        id,
        adminId,
        name,
        code,
        number,
      ];
}
