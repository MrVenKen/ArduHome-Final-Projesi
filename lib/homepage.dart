import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_home/blinds.dart';
import 'package:smart_home/curtains.dart';
import 'package:smart_home/drawer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
            child: Text(
          "Akıllı Ev Sistemi",
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                alignment: Alignment.bottomLeft,
                icon: Image.asset(
                  'assets/curtains.png',
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
                iconSize: 46.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CurtainsPage();
                  }));
                }),
            IconButton(
                alignment: Alignment.bottomCenter,
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                iconSize: 46.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Homepage();
                  }));
                }),
            IconButton(
                alignment: Alignment.bottomRight,
                icon: Image.asset(
                  'assets/blinds.png',
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
                iconSize: 46.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BlindsPage();
                  }));
                }),
          ],
        ),
      ),
      body: Container(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Perde kontrol sayfası için sol alt kısımda bulunan 'Perde' ikonuna, Panjur kontrol sayfası içinse sağ alt kısımda bulunan 'Panjur' ikonuna tıklayınız",
              style: TextStyle(fontSize: 35),
            ),
          ),
        )),
      ),
    );
  }
}
