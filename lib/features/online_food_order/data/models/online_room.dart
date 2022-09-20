import 'package:auto_food/features/online_food_order/domain/entities/room.dart';

class OnlineRoomModel extends OnlineRoom {
  const OnlineRoomModel({
    required super.id,
    required super.adminId,
    required super.name,
    required super.code,
    required super.number,
  });

  factory OnlineRoomModel.fromJson(Map<String, dynamic> json) =>
      OnlineRoomModel(
        adminId: json["admin_id"],
        name: json["name"],
        code: json["code"],
        number: json["number"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "admin_id": adminId,
        "name": name,
        "code": code,
        "number": number,
        "_id": id,
      };
}
