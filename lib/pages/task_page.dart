import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notif_wormanager_app/services/workmanager_service.dart';
import 'package:workmanager/workmanager.dart';

class TaskerPage extends StatefulWidget {
  const TaskerPage({Key? key}) : super(key: key);

  @override
  _TaskerPageState createState() => _TaskerPageState();
}

class _TaskerPageState extends State<TaskerPage> {
  int _counterValue = 0;

  final BackGroundWorkService _backGroundWorkService = Get.find();

  @override
  void initState() {
    super.initState();
    Workmanager().registerPeriodicTask("BackGround_Work3", "Tarea_programada3",
        initialDelay: const Duration(seconds: 10));
    loadData();
  }

  void loadData() async {
    _counterValue = await _backGroundWorkService.getBackGroundCounterValue();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tarea en segundo plano'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Contador: $_counterValue"),
              ElevatedButton(
                onPressed: () {
                  loadData();
                },
                child: const Text("Buscar valor actual"),
              )
            ],
          ),
        ));
  }
}
