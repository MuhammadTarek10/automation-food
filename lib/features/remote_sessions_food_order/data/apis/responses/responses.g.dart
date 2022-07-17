// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAuthTokenResponse _$RemoteAuthTokenResponseFromJson(
        Map<String, dynamic> json) =>
    RemoteAuthTokenResponse(
      json['token'] as String,
    );

Map<String, dynamic> _$RemoteAuthTokenResponseToJson(
        RemoteAuthTokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['_id'] as String,
      json['name'] as String,
      json['email'] as String,
      json['password'] as String,
      json['isAdmin'] as bool,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'isAdmin': instance.isAdmin,
    };

RemoteRegisterResponse _$RemoteRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    RemoteRegisterResponse(
      json['_id'] as String,
      json['name'] as String,
      json['email'] as String,
      json['password'] as String,
      json['isAdmin'] as bool,
    );

Map<String, dynamic> _$RemoteRegisterResponseToJson(
        RemoteRegisterResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'isAdmin': instance.isAdmin,
    };

RemoteOrderResponse _$RemoteOrderResponseFromJson(Map<String, dynamic> json) =>
    RemoteOrderResponse(
      json['_id'] as String,
      json['user_id'] as String,
      json['session_id'] as String,
      json['name'] as String,
      (json['price'] as num).toDouble(),
      json['done'] as bool,
    );

Map<String, dynamic> _$RemoteOrderResponseToJson(
        RemoteOrderResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'name': instance.name,
      'price': instance.price,
      'done': instance.done,
    };

RemoteOrderInSessionResponse _$RemoteOrderInSessionResponseFromJson(
        Map<String, dynamic> json) =>
    RemoteOrderInSessionResponse(
      json['_id'] as String,
      json['user_id'] as String,
      json['session_id'] as String,
      json['name'] as String,
      (json['price'] as num).toDouble(),
      json['done'] as bool,
      UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteOrderInSessionResponseToJson(
        RemoteOrderInSessionResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'name': instance.name,
      'price': instance.price,
      'done': instance.done,
      'user': instance.user,
    };

RemoteGetOrdersResponse _$RemoteGetOrdersResponseFromJson(
        Map<String, dynamic> json) =>
    RemoteGetOrdersResponse(
      (json['orders'] as List<dynamic>)
          .map((e) =>
              RemoteOrderInSessionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteGetOrdersResponseToJson(
        RemoteGetOrdersResponse instance) =>
    <String, dynamic>{
      'orders': instance.orders,
    };

RemoteConclusionResponse _$RemoteConclusionResponseFromJson(
        Map<String, dynamic> json) =>
    RemoteConclusionResponse(
      json['_id'] as String,
      json['user_id'] as String,
      json['session_id'] as String,
      (json['total'] as num).toDouble(),
      (json['orders'] as List<dynamic>)
          .map((e) => RemoteOrderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteConclusionResponseToJson(
        RemoteConclusionResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'total': instance.total,
      'orders': instance.orders,
    };

RemoteSessionResponse _$RemoteSessionResponseFromJson(
        Map<String, dynamic> json) =>
    RemoteSessionResponse(
      json['_id'] as String,
      json['user_id'] as String,
      json['name'] as String,
      json['code'] as String,
      json['number'] as int,
    );

Map<String, dynamic> _$RemoteSessionResponseToJson(
        RemoteSessionResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'code': instance.code,
      'number': instance.number,
    };
