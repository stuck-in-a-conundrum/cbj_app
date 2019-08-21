import 'package:flutter/material.dart';
import 'package:smart_home_flutter/objects/interface_darta/cloud_interface_data.dart';
import 'package:smart_home_flutter/ui/room_page/room_page.dart';

import 'home_page/home_page.dart';
import 'login_page/login_page.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
//    HomePage.tag: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart home',
//      darkTheme: ThemeData(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlueAccent,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
          body2: TextStyle(color: Colors.white70),
        ),
        fontFamily: 'gidole_regular',
      ),
      routes: {
        '/': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => HomePage(),
//        '/home_settings': (BuildContext context) => SettingsPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        } else if (pathElements[1] == 'roomRage') {
          return MaterialPageRoute(
              builder: (BuildContext context) =>
                  RoomPage(rooms[int.parse(pathElements[2])].getRoomName()));
        }
        return null;
      },
    );
  }
}