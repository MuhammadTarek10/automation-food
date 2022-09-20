import 'package:json_annotation/json_annotation.dart';
part 'requests.g.dart';

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({
    required this.email,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class RegisterRequest {
  final String name;
  final String email;
  final String password;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class RoomIdRequest {
  @JsonKey(name: "room_id")
  final String roomId;

  const RoomIdRequest({
    required this.roomId,
  });

  factory RoomIdRequest.fromJson(Map<String, dynamic> json) =>
      _$RoomIdRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RoomIdRequestToJson(this);
}

@JsonSerializable()
class CreateRoomRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "number")
  final int? number;

  const CreateRoomRequest({
    required this.name,
    required this.code,
    this.number,
  });

  factory CreateRoomRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateRoomRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRoomRequestToJson(this);
}

@JsonSerializable()
class AddOrderRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "price")
  final double price;
  @JsonKey(name: "room_id")
  final String roomId;

  const AddOrderRequest({
    required this.name,
    required this.price,
    required this.roomId,
  });

  factory AddOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$AddOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrderRequestToJson(this);
}
