import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'remote_sessions_food_order_event.dart';
part 'remote_sessions_food_order_state.dart';

class RemoteSessionsFoodOrderBloc
    extends Bloc<RemoteSessionsFoodOrderEvent, RemoteSessionsFoodOrderState> {
  RemoteSessionsFoodOrderBloc() : super(RemoteSessionsFoodOrderInitial()) {
    on<RemoteSessionsFoodOrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
