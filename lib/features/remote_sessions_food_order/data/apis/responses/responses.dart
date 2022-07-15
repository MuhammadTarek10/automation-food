import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class RemoteAuthTokenResponse {
  @JsonKey(name: 'token')
  String token;

  RemoteAuthTokenResponse(this.token);

  factory RemoteAuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteAuthTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAuthTokenResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "Id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "isAdmin")
  bool isAdmin;

  UserResponse(this.id, this.name, this.email, this.password, this.isAdmin);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class RemoteRegisterResponse {
  UserResponse user;

  RemoteRegisterResponse(this.user);

  factory RemoteRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteRegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteRegisterResponseToJson(this);
}

@JsonSerializable()
class RemoteOrderResponse {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "session_id")
  String sessionId;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "price")
  double price;
  @JsonKey(name: "done")
  bool done;

  RemoteOrderResponse(
      this.id, this.userId, this.sessionId, this.name, this.price, this.done);

  factory RemoteOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOrderResponseToJson(this);
}

@JsonSerializable()
class RemoteOrderInSessionResponse {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "session_id")
  String sessionId;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "price")
  double price;
  @JsonKey(name: "done")
  bool done;
  @JsonKey(name: "user")
  UserResponse user;

  RemoteOrderInSessionResponse(
    this.id,
    this.userId,
    this.sessionId,
    this.name,
    this.price,
    this.done,
    this.user,
  );

  factory RemoteOrderInSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteOrderInSessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOrderInSessionResponseToJson(this);
}

@JsonSerializable()
class RemoteGetOrdersResponse {
  List<RemoteOrderInSessionResponse> orders;

  RemoteGetOrdersResponse(this.orders);

  factory RemoteGetOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetOrdersResponseToJson(this);
}

@JsonSerializable()
class RemoteConclusionResponse {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "session_id")
  String sessionId;
  @JsonKey(name: "total")
  double total;
  @JsonKey(name: "orders")
  List<RemoteOrderResponse> orders;

  RemoteConclusionResponse(
    this.id,
    this.userId,
    this.sessionId,
    this.total,
    this.orders,
  );

  factory RemoteConclusionResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteConclusionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteConclusionResponseToJson(this);
}

@JsonSerializable()
class RemoteSessionResponse {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "number")
  int number;

  RemoteSessionResponse(
    this.id,
    this.userId,
    this.name,
    this.code,
    this.number,
  );

  factory RemoteSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteSessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSessionResponseToJson(this);
}
