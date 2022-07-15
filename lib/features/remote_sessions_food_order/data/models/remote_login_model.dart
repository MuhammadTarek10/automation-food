class LoginModel {
  const LoginModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class RespondedLoginModel {
  RespondedLoginModel({
    required this.token,
  });
  final String token;
}
