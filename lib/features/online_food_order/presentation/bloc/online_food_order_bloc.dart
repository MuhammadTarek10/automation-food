import 'package:auto_food/features/online_food_order/domain/entities/user.dart';
import 'package:auto_food/features/online_food_order/domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'online_food_order_event.dart';
part 'online_food_order_state.dart';

class OnlineFoodOrderBloc
    extends Bloc<OnlineFoodOrderEvent, OnlineFoodOrderState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  OnlineFoodOrderBloc({
    required this.loginUseCase,
    required this.registerUseCase,
  }) : super(OnlineFoodOrderInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(OnlineLoading());
      emit(
        (await loginUseCase(event.email, event.password)).fold(
          (failure) => LoginFailedState(message: failure.getMessage),
          (user) => LoginSuccessState(user: user),
        ),
      );
    });
  }
}
