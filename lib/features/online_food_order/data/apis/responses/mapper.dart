import 'package:auto_food/features/online_food_order/data/apis/responses/responses.dart';
import 'package:auto_food/features/online_food_order/data/models/user.dart';

extension LoginResponseExtension on LoginResponse {
  UserModel toModel() {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
    );
  }
}
