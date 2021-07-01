import 'package:flutter/material.dart';
import 'package:smart_home/curtains.dart';
import 'package:smart_home/drawer.dart';
import 'package:smart_home/homepage.dart';

class BlindsPage extends StatefulWidget {
  @override
  _BlindsPageState createState() => _BlindsPageState();
}

class _BlindsPageState extends State<BlindsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
            child: Text(
          "Panjur Kontrol Sayfası",
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
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
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Panjuru açmak için 'YUKARI'yön tuşuna, kapatmak için 'AŞAĞI' yön tuşuna basınız.",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: IconButton(
                    icon: Icon(Icons.arrow_upward),
                    iconSize: 76,
                    alignment: Alignment.topCenter,
                    onPressed: () {}),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: IconButton(
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 76,
                    alignment: Alignment.bottomCenter,
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
