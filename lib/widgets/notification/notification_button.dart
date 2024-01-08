import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, '/NOTIFICATION', arguments: {
          "title": "Hello",
        });
      },
      icon: const Icon(Icons.notifications),
    );
  }
}
