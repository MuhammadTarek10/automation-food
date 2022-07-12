part of 'food_order_bloc.dart';

abstract class FoodOrderEvent extends Equatable {
  const FoodOrderEvent();

  @override
  List<Object> get props => [];
}

class AddOrderEvent extends FoodOrderEvent {
  final String name;
  final String order;
  final double price;
  final double payed;
  final double remaining;

  const AddOrderEvent({
    required this.name,
    required this.order,
    required this.price,
    required this.payed,
    required this.remaining,
  });

  @override
  List<Object> get props => [name, order, price, payed, remaining];
}

class GetOrdersEvent extends FoodOrderEvent {}

class DeleteOrderEvent extends FoodOrderEvent {
  final OrderModel order;

  const DeleteOrderEvent({required this.order});

  @override
  List<Object> get props => [order];
}

class UpdateOrderEvent extends FoodOrderEvent {
  final OrderModel order;

  const UpdateOrderEvent({required this.order});

  @override
  List<Object> get props => [order];
}

class DeleteAllOrdersEvent extends FoodOrderEvent {}

class GetConclusionEvent extends FoodOrderEvent {}

class UpdateOrderDoneEvent extends FoodOrderEvent {
  final OrderModel order;

  const UpdateOrderDoneEvent({required this.order});

  @override
  List<Object> get props => [order];
}

class ClearAllInputsEvent extends FoodOrderEvent {}
