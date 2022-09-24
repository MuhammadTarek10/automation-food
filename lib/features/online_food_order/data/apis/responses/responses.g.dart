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
      rooms: (json['rooms'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'rooms': instance.rooms,
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
      admin: UserResponse.fromJson(json['admin'] as Map<String, dynamic>),
      name: json['name'] as String,
      code: json['code'] as String,
      number: json['number'] as int,
      users: (json['users'] as List<dynamic>)
          .map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomResponseToJson(RoomResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'admin_id': instance.adminId,
      'admin': instance.admin,
      'name': instance.name,
      'code': instance.code,
      'number': instance.number,
      'users': instance.users,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      id: json['_id'] as String,
      username: json['username'] as String,
      roomId: json['room_id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      done: json['done'] as bool,
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
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
