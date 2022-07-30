import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:auto_food/features/food_order/data/models/local_order_model.dart';
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
  final GetConclusionByOrderUseCase getConclusionUseCase;
  final UpdateOrderDoneUseCase updateOrderDoneUseCase;
  final GetConclusionByUserUseCase getConclusionByUserUseCase;
  FoodOrderBloc(
      {required this.saveOrderUseCase,
      required this.deleteOrderUseCase,
      required this.getOrdersUseCase,
      required this.updateOrderUseCase,
      required this.deleteAllOrdersUseCase,
      required this.getConclusionUseCase,
      required this.updateOrderDoneUseCase,
      required this.getConclusionByUserUseCase})
      : super(FoodOrderInitial()) {
    on<AddOrderEvent>((event, emit) async {
      emit(AddingOrderLoadingState());
      final order = LocalOrderModel(
        id: const Uuid().v4(),
        name: event.name,
        order: event.order.trim(),
        price: event.price,
        payed: event.payed,
        remaining: event.remaining,
        done: AppStrings.orderModelNotDone,
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

    on<GetConclusionByOrderEvent>((event, emit) async {
      emit(ConclusionInitialState());
      emit(ConclusionLoaidingState());
      emit(
        (await getConclusionUseCase(NoParams())).fold(
          (failure) => ConclusionErrorState(message: failure.getMessage),
          (conclusion) => ConclusionByOrderLoadedState(conclusion: conclusion),
        ),
      );
    });

    on<UpdateOrderDoneEvent>((event, emit) async {
      emit(AddingOrderLoadingState());
      emit(
        (await updateOrderDoneUseCase(event.order)).fold(
          (failure) => AddingOrderErrorState(message: failure.getMessage),
          (_) => AddingOrderSuccessState(),
        ),
      );
    });
    on<ClearAllInputsEvent>((event, emit) async {
      emit(ClearAllInputsState());
    });

    on<GetConclusionByUserEvent>(
      ((event, emit) async {
        emit(ConclusionLoaidingState());
        emit(
          (await getConclusionByUserUseCase(NoParams())).fold(
            (failure) => ConclusionErrorState(message: failure.getMessage),
            (conclusion) => ConclusionByUserLoadedState(conclusion: conclusion),
          ),
        );
      }),
    );
    on<AddGroupOrdersEvent>((event, emit) async {
      emit(AddingOrderLoadingState());
      final name = event.name;
      final orders = event.order.split(',');
      final prices = event.price.split(',');
      final payeds = event.payed.split(',');
      final models = <LocalOrderModel>[];
      for (var i = 0; i < orders.length; i++) {
        final order = LocalOrderModel(
          id: const Uuid().v4(),
          name: name,
          order: orders[i].trim(),
          price: double.parse(prices[i].trim()),
          payed: double.parse(payeds[i].trim()),
          remaining: double.parse(
            (double.parse(prices[i]) - double.parse(payeds[i]))
                .toStringAsFixed(2),
          ),
          done: AppStrings.orderModelNotDone,
        );
        models.add(order);
      }
      for (var model in models) {
        emit(
          (await saveOrderUseCase.call(model)).fold(
            (failure) => AddingOrderErrorState(message: failure.getMessage),
            (_) => AddingOrderSuccessState(),
          ),
        );
      }
    });
  }
}
