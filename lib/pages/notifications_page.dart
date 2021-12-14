import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notif_wormanager_app/services/notifications_service.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final NotificationService _notificationService = Get.find();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await _notificationService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notificaciones"),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('Mostrar Notificacion'),
                    onPressed: () async {
                      await _notificationService.showNotification(
                          "Notificacion fija", "Esta es una notificacion fija");
                    },
                  ),
                  const SizedBox(height: 3),
                  ElevatedButton(
                    child: const Text('Agendar Notificacion'),
                    onPressed: () async {
                      await _notificationService.scheduleNotification(
                          "Notificacion Agendada", "Se ejecuta ahora");
                    },
                  ),
                  const SizedBox(height: 3),
                  ElevatedButton(
                    child: const Text('Cancelar Notificacion'),
                    onPressed: () async {
                      await _notificationService.cancelNotificacion(0);
                    },
                  ),
                  const SizedBox(height: 3),
                  ElevatedButton(
                    child: const Text('Cancelar todas las Notificationes'),
                    onPressed: () async {
                      await _notificationService.cancelAllNotificacions();
                    },
                  ),
                  const SizedBox(height: 3),
                ],
              ),
            )));
  }
}
