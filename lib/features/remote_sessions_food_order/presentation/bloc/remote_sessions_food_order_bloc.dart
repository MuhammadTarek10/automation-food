import 'package:auto_food/features/food_order/domain/usecases/conclusion_usecase.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_login_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_registration_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/usecases/remote_auth_usecases.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/usecases/remote_order_usecases.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/usecases/remote_session_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'remote_sessions_food_order_event.dart';
part 'remote_sessions_food_order_state.dart';

class RemoteSessionsFoodOrderBloc
    extends Bloc<RemoteSessionsFoodOrderEvent, RemoteSessionsFoodOrderState> {
  final CreateSessionUeeCase createSessionUseCase;
  final GetSessionsUeeCase getSessionUseCase;
  final SearchSessionUeeCase searchSessionUseCase;
  final DeleteSessionUeeCase deleteSessionUseCase;
  final RemoteGetOtderUseCase getOrderUseCase;
  final RemoteAddOrderUseCase addOrderUseCase;
  final RemoteDeleteOrderUseCase deleteOrderUseCase;
  final RemoteEditOrderUseCase editOrderUseCase;
  final RemoteLoginUseCase loginUseCase;
  final RemoteRegisterUseCase registerUsecase;
  final GetConclusionUseCase getConclusionUseCase;

  RemoteSessionsFoodOrderBloc({
    required this.createSessionUseCase,
    required this.getSessionUseCase,
    required this.searchSessionUseCase,
    required this.deleteSessionUseCase,
    required this.getOrderUseCase,
    required this.addOrderUseCase,
    required this.deleteOrderUseCase,
    required this.editOrderUseCase,
    required this.loginUseCase,
    required this.registerUsecase,
    required this.getConclusionUseCase,
  }) : super(RemoteSessionsFoodOrderInitial()) {
    var sessionId = 0;
    on<LoginEvent>(
      ((event, emit) async {
        emit(RemoteSessionFoodOrderLoading());
        final loginRequest = LoginRequest(
          email: event.model.email,
          password: event.model.password,
        );
        emit(
          (await loginUseCase(loginRequest)).fold(
            (failure) => LoggedInFailed(message: failure.getMessage),
            (token) => LoggedInSuccessfully(token: token),
          ),
        );
      }),
    );
  }
}
