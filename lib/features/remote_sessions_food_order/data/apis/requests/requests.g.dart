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

RemoteSessionRequest _$RemoteSessionRequestFromJson(
        Map<String, dynamic> json) =>
    RemoteSessionRequest(
      name: json['name'] as String,
      code: json['code'] as String,
      number: json['number'] as int,
    );

Map<String, dynamic> _$RemoteSessionRequestToJson(
        RemoteSessionRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'number': instance.number,
    };

RemoteOrderRequest _$RemoteOrderRequestFromJson(Map<String, dynamic> json) =>
    RemoteOrderRequest(
      sessionId: json['session_id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      done: json['done'] as bool,
    );

Map<String, dynamic> _$RemoteOrderRequestToJson(RemoteOrderRequest instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'name': instance.name,
      'price': instance.price,
      'done': instance.done,
    };

RemoteSessionDeleteRequest _$RemoteSessionDeleteRequestFromJson(
        Map<String, dynamic> json) =>
    RemoteSessionDeleteRequest(
      sessionId: json['session_id'] as String,
    );

Map<String, dynamic> _$RemoteSessionDeleteRequestToJson(
        RemoteSessionDeleteRequest instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
    };
