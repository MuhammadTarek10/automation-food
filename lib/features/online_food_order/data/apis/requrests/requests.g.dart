// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };

RoomIdRequest _$RoomIdRequestFromJson(Map<String, dynamic> json) =>
    RoomIdRequest(
      roomId: json['room_id'] as String,
    );

Map<String, dynamic> _$RoomIdRequestToJson(RoomIdRequest instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
    };

CreateRoomRequest _$CreateRoomRequestFromJson(Map<String, dynamic> json) =>
    CreateRoomRequest(
      name: json['name'] as String,
      code: json['code'] as String,
      number: json['number'] as int?,
    );

Map<String, dynamic> _$CreateRoomRequestToJson(CreateRoomRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'number': instance.number,
    };

AddOrderRequest _$AddOrderRequestFromJson(Map<String, dynamic> json) =>
    AddOrderRequest(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      roomId: json['room_id'] as String,
    );

Map<String, dynamic> _$AddOrderRequestToJson(AddOrderRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'room_id': instance.roomId,
    };

JoinRoomRequest _$JoinRoomRequestFromJson(Map<String, dynamic> json) =>
    JoinRoomRequest(
      code: json['code'] as String,
    );

Map<String, dynamic> _$JoinRoomRequestToJson(JoinRoomRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
    };
