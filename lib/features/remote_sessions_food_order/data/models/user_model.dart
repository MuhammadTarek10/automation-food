class RemoteUserModel {
  const RemoteUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.isAdmin,
  });
  final String id;
  final String name;
  final String email;
  final String password;
  final bool isAdmin;
}
