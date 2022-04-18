import 'package:flutter/material.dart';

class NotificationListenerWidget extends StatefulWidget {
  NotificationListenerWidget({Key? key}) : super(key: key);

  @override
  State<NotificationListenerWidget> createState() =>
      _NotificationListenerWidgetState();
}

class _NotificationListenerWidgetState
    extends State<NotificationListenerWidget> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (Notification notification) {
        print('notification is 👉 $notification');
        return false;
      },
      child: ListView.builder(itemBuilder: (_, index) => Text("$index")),
    );
  }
}
