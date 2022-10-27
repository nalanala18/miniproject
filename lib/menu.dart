import 'package:flutter/material.dart';
import 'package:mini_project_1/calender/main.dart';
import 'package:mini_project_1/splashscreen.dart';
import 'package:mini_project_1/todo.dart';

class menuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
            DrawerHeader(
            child: Stack(
              children: [
                Positioned(
                  bottom: 8.0,
                  left: 4.0,
                  child: Text(
                    'Mini Project',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                ),
          ),
          ListTile(
            leading: Icon(Icons.task),
            title: Text('Todo List'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoApp())
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_view_month_sharp),
            title: Text('Calender'),
            onTap: () => 
              {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventCalendar())
              )},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SplashScreen())
              )
            },
          ),
        ],
      ),
    );
  }
}