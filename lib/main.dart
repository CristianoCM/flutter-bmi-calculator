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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Input your data";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    _changeInfoText();
  }

  void _changeInfoText({txt}) {
    setState(() {
      _infoText = txt ?? "Input your data";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    String weightTxt = weightController.text.replaceAll(",", ".");
    String heightTxt = heightController.text.replaceAll(",", ".");

    double weight = double.parse(weightTxt);
    double height = double.parse(heightTxt);
    double imc = weight / (height * height);

    String imcS = imc.toStringAsPrecision(2);
    String txt = "";

    if (imc < 18.6) {
      txt = "Low. $imcS";
    } else if (imc >= 18.6 && imc < 24.9) {
      txt = "Ideal. $imcS";
    } else if (imc >= 24.9 && imc < 29.9) {
      txt = "High. $imcS";
    } else if (imc >= 29.9 && imc < 34.9) {
      txt = "Very High. $imcS";
    } else if (imc >= 34.9 && imc < 39.9) {
      txt = "Extremely High. $imcS";
    } else if (imc >= 39.9) {
      txt = "Oh god... $imcS";
    }

    _changeInfoText(txt: txt);
  }

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
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    size: 120.0,
                    color: Colors.purple,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Mass (kg)",
                        labelStyle: TextStyle(
                          color: Colors.purple,
                          fontSize: 25.0,
                        )),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.purple, fontSize: 25.0),
                    controller: weightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please, inform your weigth";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Height (m)",
                        labelStyle: TextStyle(
                          color: Colors.purple,
                          fontSize: 25.0,
                        )),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.purple, fontSize: 25.0),
                    controller: heightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please, inform your height";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0, bottom: 35.0),
                    child: Container(
                      height: 70.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _calculate();
                          }
                        },
                        child: Text(
                          "Calculate",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Text(
                    "$_infoText",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
            )));
  }
}
