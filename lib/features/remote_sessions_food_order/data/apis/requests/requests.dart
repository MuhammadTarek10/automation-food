class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({
    required this.email,
    required this.password,
  });
}

class RegisterRequest {
  final String name;
  final String email;
  final String password;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
  });
}

class RemoteSessionRequest {
  final String userId;
  final String name;
  final String code;
  final int number;

  const RemoteSessionRequest({
    required this.userId,
    required this.name,
    required this.code,
    required this.number,
  });
}

class RemoteOrderRequest {
  final String userId;
  final String sessionId;
  final String name;
  final double price;
  final bool done;

  const RemoteOrderRequest({
    required this.userId,
    required this.sessionId,
    required this.name,
    required this.price,
    required this.done,
  });
}
