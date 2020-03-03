import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Body Mass Index Calculator"),
          centerTitle: true,
          backgroundColor: Colors.purple,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.refresh,
              ),
              onPressed: () {},
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.purple,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Mass (kg)",
                    labelStyle: TextStyle(
                      color: Colors.purple,
                      fontSize: 25.0,
                    )),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 25.0),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Height (m)",
                    labelStyle: TextStyle(
                      color: Colors.purple,
                      fontSize: 25.0,
                    )),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 25.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0, bottom: 35.0),
                child: Container(
                  height: 70.0,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Calculate",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    color: Colors.purple,
                  ),
                ),
              ),
              Text(
                "Info",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18.0,
                ),
              )
            ],
          ),
        ));
  }
}
