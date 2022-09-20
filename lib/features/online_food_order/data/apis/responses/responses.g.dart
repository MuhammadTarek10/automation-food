// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      token: json['token'] as String,
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };

GetRoomsResponse _$GetRoomsResponseFromJson(List<dynamic> json) =>
    GetRoomsResponse(
      rooms: json
          .map((e) => RoomResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRoomsResponseToJson(GetRoomsResponse instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
    };

RoomResponse _$RoomResponseFromJson(Map<String, dynamic> json) => RoomResponse(
      id: json['_id'] as String,
      adminId: json['admin_id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      number: json['number'] as int,
    );

Map<String, dynamic> _$RoomResponseToJson(RoomResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'admin_id': instance.adminId,
      'name': instance.name,
      'code': instance.code,
      'number': instance.number,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      id: json['_id'] as String,
      userId: json['user_id'] as String,
      roomId: json['room_id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      done: json['done'] as bool,
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'room_id': instance.roomId,
      'name': instance.name,
      'price': instance.price,
      'done': instance.done,
    };

OrderInRoomSingleResponse _$OrderInRoomSingleResponseFromJson(
        Map<String, dynamic> json) =>
    OrderInRoomSingleResponse(
      order: OrderResponse.fromJson(json),
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderInRoomSingleResponseToJson(
        OrderInRoomSingleResponse instance) =>
    <String, dynamic>{
      'order': instance.order,
      'user': instance.user,
    };

OrderInRoomResponse _$OrderInRoomResponseFromJson(List<dynamic> json) =>
    OrderInRoomResponse(
      data: json
          .map((e) =>
              OrderInRoomSingleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderInRoomResponseToJson(
        OrderInRoomResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
