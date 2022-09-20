import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/online_food_order/domain/entities/order_in_room.dart';
import 'package:auto_food/features/online_food_order/domain/entities/room.dart';
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
  final GetRoomsUseCase getRoomsUseCase;
  final GetOrdersInRoomUseCase getOrdersInRoomUseCase;
  final CreateRoomUseCase createRoomUseCase;
  final AddOrderUseCase addOrderUseCase;

  OnlineFoodOrderBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.getRoomsUseCase,
    required this.getOrdersInRoomUseCase,
    required this.createRoomUseCase,
    required this.addOrderUseCase,
  }) : super(OnlineFoodOrderInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(OnlineLoading());
      emit(
        (await loginUseCase(event.email, event.password)).fold(
          (failure) => FailedState(message: failure.getMessage),
          (user) => LoginSuccessState(user: user),
        ),
      );
    });

    on<RegisterEvent>((event, emit) async {
      emit(OnlineLoading());
      emit(
        (await registerUseCase(event.name, event.email, event.password)).fold(
          (failure) => FailedState(message: failure.getMessage),
          (user) => RegisterSuccessState(),
        ),
      );
    });

    on<GetRoomsEvent>((event, emit) async {
      emit(OnlineLoading());
      emit(
        (await getRoomsUseCase(NoParams())).fold(
          (failure) => FailedState(message: failure.getMessage),
          (rooms) => GetRoomsSuccessState(rooms: rooms),
        ),
      );
    });

    on<GetRoomOrdersEvent>((event, emit) async {
      emit(OnlineLoading());
      emit(
        (await getOrdersInRoomUseCase(NoParams())).fold(
          (failure) => FailedState(message: failure.getMessage),
          (orders) => GetRoomOrdersSuccess(orders: orders),
        ),
      );
    });

    on<CreateRoomEvent>((event, emit) async {
      emit(
        (await createRoomUseCase(event.name, event.code, event.number)).fold(
          (failure) => FailedState(message: failure.getMessage),
          (unit) => GenericSuccessState(),
        ),
      );
    });
    on<AddOnlineOrderEvent>((event, emit) async {
      emit(
        (await addOrderUseCase(event.name, event.price)).fold(
          (failure) => FailedState(message: failure.getMessage),
          (unit) => GenericSuccessState(),
        ),
      );
    });
  }
}
