import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/food_order/data/models/order_model.dart';
import 'package:auto_food/features/food_order/domain/usecases/conclusion_usecase.dart';
import 'package:auto_food/features/food_order/domain/usecases/order_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'food_order_event.dart';
part 'food_order_state.dart';

class FoodOrderBloc extends Bloc<FoodOrderEvent, FoodOrderState> {
  final SaveOrderUseCase saveOrderUseCase;
  final DeleteOrderUseCase deleteOrderUseCase;
  final GetOrdersUseCase getOrdersUseCase;
  final UpdateOrderUseCase updateOrderUseCase;
  final DeleteAllOrdersUseCase deleteAllOrdersUseCase;
  final GetConclusionUseCase getConclusionUseCase;
  FoodOrderBloc({
    required this.saveOrderUseCase,
    required this.deleteOrderUseCase,
    required this.getOrdersUseCase,
    required this.updateOrderUseCase,
    required this.deleteAllOrdersUseCase,
    required this.getConclusionUseCase
  }) : super(FoodOrderInitial()) {
    on<AddOrderEvent>((event, emit) async {
      emit(AddingOrderLoadingState());
      final order = OrderModel(
        id: const Uuid().v4(),
        name: event.name,
        order: event.order,
        price: event.price,
        payed: event.payed,
        remaining: event.remaining,
      );
      emit(
        (await saveOrderUseCase.call(order)).fold(
          (failure) => AddingOrderErrorState(message: failure.getMessage),
          (_) => AddingOrderSuccessState(),
        ),
      );
    });

    on<GetOrdersEvent>((event, emit) async {
      emit(AddingOrderLoadingState());
      emit(
        (await getOrdersUseCase(NoParams())).fold(
          (failure) => DataEmptyState(),
          (orders) => DataLoadedState(orders: orders),
        ),
      );
    });

    on<DeleteOrderEvent>((event, emit) async {
      emit(AddingOrderLoadingState());
      emit(
        (await deleteOrderUseCase(event.order)).fold(
          (failure) => AddingOrderErrorState(message: failure.getMessage),
          (_) => AddingOrderSuccessState(),
        ),
      );
    });

    on<UpdateOrderEvent>((event, emit) async {
      emit(AddingOrderLoadingState());
      emit(
        (await saveOrderUseCase(event.order)).fold(
          (failure) => AddingOrderErrorState(message: failure.getMessage),
          (_) => AddingOrderSuccessState(),
        ),
      );
    });

    on<DeleteAllOrdersEvent>((event, emit) async {
      emit(AddingOrderLoadingState());
      emit(
        (await deleteAllOrdersUseCase(NoParams())).fold(
          (failure) => AddingOrderErrorState(message: failure.getMessage),
          (_) => AddingOrderSuccessState(),
        ),
      );
    });
  }
}
