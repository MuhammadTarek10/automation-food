import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/domain/usecases/conclusion_usecase.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_session_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/user_model.dart';
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
  final GetConclusionByOrderUseCase getConclusionUseCase;

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
          email: event.request.email,
          password: event.request.password,
        );
        emit(
          (await loginUseCase(loginRequest)).fold(
            (failure) => LoggedInFailed(message: failure.getMessage),
            (token) => LoggedInSuccessfully(token: token),
          ),
        );
      }),
    );

    on<TryingToLoginEvent>(((event, emit) {
      emit(TryingToLoginState());
    }));

    on<AutomatedLoginEvent>(((event, emit) async {
      final loginRequest = LoginRequest(
        email: event.request.email,
        password: event.request.password,
      );
      emit(
        (await loginUseCase(loginRequest)).fold(
          (failure) => LoggedInFailed(message: failure.getMessage),
          (token) => LoggedInSuccessfully(token: token),
        ),
      );
    }));

    on<LoggedOutEvent>(((event, emit) {
      emit(LoggedOutState());
    }));

    on<RegisterEvent>(((event, emit) async {
      emit(RemoteSessionFoodOrderLoading());
      final registerRequest = RegisterRequest(
        name: event.request.name,
        email: event.request.email,
        password: event.request.password,
      );
      emit(
        (await registerUsecase(registerRequest)).fold(
          (failure) => RegisterFailed(message: failure.getMessage),
          (user) => RegisterSuccessfully(user: user),
        ),
      );
    }));

    on<GetSessionsEvent>(
      ((event, emit) async {
        emit(RemoteSessionFoodOrderLoading());
        emit(
          (await getSessionUseCase(NoParams())).fold(
            (failure) =>
                failure.getMessage == AppStrings.unauthorizedFailureMessage
                    ? GetSessionsFailed(message: failure.getMessage)
                    : SessionFaildShouldLoggout(),
            (sessions) => GetSessionsSuccessfully(sessions: sessions),
          ),
        );
      }),
    );
  }
}
