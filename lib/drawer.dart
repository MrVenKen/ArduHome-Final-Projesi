import 'package:flutter/material.dart';
import 'package:smart_home/settings.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Align(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 100.0,
                ),
                Text(
                  "Ayarlar"),
              ],
              ),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("ESP32 Ayarları"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SettingsPage();
                  }));
                },
              ),
          ],
        ),
      );
  }
}