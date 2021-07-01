import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ESP32 Ayarları")),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150, right: 50, left: 50,  bottom: 150),
            child: Column(
              children: [
                IconButton(icon: Icon(Icons.bluetooth, size: 70,), onPressed: (){}),
                SizedBox(height: 150,),
                IconButton(icon: Icon(Icons.wifi, size: 70,), onPressed: (){}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}