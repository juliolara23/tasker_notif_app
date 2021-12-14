import 'package:flutter/material.dart';
import 'package:notif_wormanager_app/pages/notifications_page.dart';
import 'package:notif_wormanager_app/pages/task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;

  static final List<Widget> _widgets = <Widget>[
    const NotificationsPage(),
    const TaskerPage()
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              //_logout();
            },
          ),
        ],
      ),
      body: _widgets.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.message_sharp), label: "Notificaciones"),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_sharp), label: "Tareas")
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
