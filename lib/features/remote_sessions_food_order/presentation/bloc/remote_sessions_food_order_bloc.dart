import 'package:auto_food/features/food_order/domain/usecases/conclusion_usecase.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/usecases/remote_auth_usecases.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/usecases/remote_order_usecases.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/usecases/remote_session_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'remote_sessions_food_order_event.dart';
part 'remote_sessions_food_order_state.dart';

class RemoteSessionsFoodOrderBloc
    extends Bloc<RemoteSessionsFoodOrderEvent, RemoteSessionsFoodOrderState> {
  final CreateSessionUeeCase createSession;
  final GetSessionsUeeCase getSession;
  final SearchSessionUeeCase searchSession;
  final DeleteSessionUeeCase deleteSession;
  final RemoteGetOtderUseCase getOrder;
  final RemoteAddOrderUseCase addOrder;
  final RemoteDeleteOrderUseCase deleteOrder;
  final RemoteEditOrderUseCase editOrder;
  final RemoteLoginUseCase login;
  final RemoteRegisterUseCase logout;
  final GetConclusionUseCase getConclusion;

  RemoteSessionsFoodOrderBloc({
    required this.createSession,
    required this.getSession,
    required this.searchSession,
    required this.deleteSession,
    required this.getOrder,
    required this.addOrder,
    required this.deleteOrder,
    required this.editOrder,
    required this.login,
    required this.logout,
    required this.getConclusion,
  }) : super(RemoteSessionsFoodOrderInitial()) {
    on<GetSessionsEvent>((event, emit) {
      emit(RemoteSessionFoodOrderLoading());
    });
  }
}
