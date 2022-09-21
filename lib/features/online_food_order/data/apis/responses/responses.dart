import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'token')
  String token;
  @JsonKey(name: "user")
  UserResponse user;

  LoginResponse({
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "rooms")
  List<String> rooms;

  UserResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.rooms,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class GetRoomsResponse {
  List<RoomResponse> rooms;

  GetRoomsResponse({
    required this.rooms,
  });

  factory GetRoomsResponse.fromJson(List<dynamic> json) =>
      _$GetRoomsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRoomsResponseToJson(this);
}

@JsonSerializable()
class RoomResponse {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "admin_id")
  String adminId;
  @JsonKey(name: "admin")
  UserResponse admin;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "number")
  int number;
  @JsonKey(name: "users")
  List<UserResponse> users;

  RoomResponse({
    required this.id,
    required this.adminId,
    required this.admin,
    required this.name,
    required this.code,
    required this.number,
    required this.users,
  });

  factory RoomResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoomResponseToJson(this);
}

@JsonSerializable()
class OrderResponse {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "room_id")
  String roomId;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "price")
  double price;
  @JsonKey(name: "done")
  bool done;

  OrderResponse({
    required this.id,
    required this.userId,
    required this.roomId,
    required this.name,
    required this.price,
    required this.done,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable()
class OrderInRoomSingleResponse {
  OrderResponse order;
  @JsonKey(name: "user")
  UserResponse user;

  OrderInRoomSingleResponse({
    required this.order,
    required this.user,
  });

  factory OrderInRoomSingleResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderInRoomSingleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderInRoomSingleResponseToJson(this);
}

@JsonSerializable()
class OrderInRoomResponse {
  List<OrderInRoomSingleResponse> data;

  OrderInRoomResponse({required this.data});

  factory OrderInRoomResponse.fromJson(List<dynamic> json) =>
      _$OrderInRoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderInRoomResponseToJson(this);
}
