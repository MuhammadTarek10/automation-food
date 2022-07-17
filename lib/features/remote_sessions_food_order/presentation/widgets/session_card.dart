import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_session_model.dart';
import 'package:flutter/material.dart';

typedef SessionCallBack = void Function(RemoteSessionModel order);

class SessionCard extends StatelessWidget {
  final List<RemoteSessionModel> sessions;
  final SessionCallBack onDelete;
  const SessionCard({Key? key, required this.sessions, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return ListTile(
          title: Text(session.name),
          subtitle: Text(session.code),
          trailing: InkWell(
            onTap: () => onDelete(session),
            child: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
