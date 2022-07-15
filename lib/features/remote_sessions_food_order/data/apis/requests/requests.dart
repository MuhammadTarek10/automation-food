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
class RemoteSessionRequest {
  final String name;
  final String code;
  final int number;

  const RemoteSessionRequest({
    required this.name,
    required this.code,
    required this.number,
  });

  factory RemoteSessionRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoteSessionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSessionRequestToJson(this);
}

@JsonSerializable()
class RemoteOrderRequest {
  final String sessionId;
  final String name;
  final double price;
  final bool done;

  const RemoteOrderRequest({
    required this.sessionId,
    required this.name,
    required this.price,
    required this.done,
  });

  factory RemoteOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoteOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOrderRequestToJson(this);
}
