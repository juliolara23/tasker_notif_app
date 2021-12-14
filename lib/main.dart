import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notif_wormanager_app/pages/home_page.dart';
import 'package:notif_wormanager_app/services/notifications_service.dart';
import 'package:notif_wormanager_app/services/workmanager_service.dart';
import 'package:workmanager/workmanager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<NotificationService>(() => NotificationService());
  Get.lazyPut<BackGroundWorkService>(() => BackGroundWorkService());
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  runApp(const MyApp());
}

void callbackDispatcher() {
  BackGroundWorkService _backGroundWorkService = BackGroundWorkService();
  Workmanager().executeTask((taskName, inputData) async {
    print("Se ejecuto la tarea");
    int value = await _backGroundWorkService.getBackGroundCounterValue();
    _backGroundWorkService.loadCounterValue(value + 1);
    return Future.value(true);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 24.0,
            ),
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 46.0,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: const TextStyle(fontSize: 18.0),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
