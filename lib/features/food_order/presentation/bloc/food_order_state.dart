part of 'food_order_bloc.dart';

abstract class FoodOrderState extends Equatable {
  const FoodOrderState();

  @override
  List<Object> get props => [];
}

class FoodOrderInitial extends FoodOrderState {}

class AddingOrderLoadingState extends FoodOrderState {}

class DataEmptyState extends FoodOrderState {}

class AddingOrderSuccessState extends FoodOrderState {
  @override
  List<LocalOrderModel> get props => [];
}

class DataLoadedState extends FoodOrderState {
  final List<LocalOrderModel> orders;

  const DataLoadedState({required this.orders});

  @override
  List<LocalOrderModel> get props => orders;
}

class AddingOrderErrorState extends FoodOrderState {
  final String message;

  const AddingOrderErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class ConclusionInitialState extends FoodOrderState {}

class ConclusionLoaidingState extends FoodOrderState {}

class ConclusionErrorState extends FoodOrderState {
  final String message;

  const ConclusionErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class ConclusionLoadedState extends FoodOrderState {
  final LocalConclusionModel conclusion;

  const ConclusionLoadedState({required this.conclusion});

  @override
  List<LocalConclusionModel> get props => [conclusion];
}

class ClearAllInputsState extends FoodOrderState {}
