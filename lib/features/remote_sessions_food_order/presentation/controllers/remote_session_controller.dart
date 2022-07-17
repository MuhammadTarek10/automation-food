import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/bloc/remote_sessions_food_order_bloc.dart';

class RemoteSessionController {
  final RemoteSessionsFoodOrderBloc bloc;
  const RemoteSessionController({required this.bloc});

  void getSessions() {
    bloc.add(GetSessionsEvent());
  }

  void createSession(String name, String code, int? number) {
    bloc.add(
      CreateSessionEvent(
        request: RemoteSessionRequest(
          name: name,
          code: code,
          number: number ?? AppStrings.defaultRoomNumber,
        ),
      ),
    );
  }

  void searchSession(String sessionId) {
    bloc.add(
      SearchSessionEvent(
        sessionId: sessionId,
      ),
    );
  }

  void deleteSession(String sessionId) {
    bloc.add(
      DeleteSessionEvent(
          request: RemoteSessionDeleteRequest(sessionId: sessionId)),
    );
  }

  void getOrders(String sessionId) {
    bloc.add(
      GetOrdersEvent(
        sessionId: sessionId,
      ),
    );
  }

  void addOrder(String sessionId, String name, double price) {
    bloc.add(
      AddOrderEvent(
        request: RemoteOrderRequest(
          sessionId: sessionId,
          name: name,
          price: price,
          done: false,
        ),
      ),
    );
  }

  void deleteOrder(String sessionId, String name, double price) {
    bloc.add(
      DeleteOrderEvent(
        request: RemoteOrderRequest(
          sessionId: sessionId,
          name: name,
          price: price,
          done: false,
        ),
      ),
    );
  }

  void editOrder(String sessionId, String name, double price) {
    bloc.add(
      EditOrderEvent(
        request: RemoteOrderRequest(
          sessionId: sessionId,
          name: name,
          price: price,
          done: false,
        ),
      ),
    );
  }

  void getConclusion(String sessionId) {
    bloc.add(
      GetConclusionEvent(
        sessionId: sessionId,
      ),
    );
  }
}
