import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  )); // MaterialApp
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController temperatureController = TextEditingController();
  String _infoText = "Informe a temperatura";
  String _value = null;
  List<String> _values = new List<String>();

  void _resetFields() {
    temperatureController.text = "";
    setState(() {
      _infoText = "Informe a temperatura";
    });
  }

  @override
  void initState() {
    _values.addAll(['Kelvin', 'Fahrenheit', 'Reaumur', 'Rankine']);
    _value = _values.elementAt(0);
  }

  void _onChanged(String value) {
    setState(() {
      _value = value;
    });
  }

  void converte() {
    if (_value == 'Kelvin') {
      setState(() {
        _infoText = (double.parse(temperatureController.text) + 273).toStringAsPrecision(3);
      });
    }
    if (_value == 'Fahrenheit') {
      setState(() {
        _infoText = ((double.parse(temperatureController.text) * 1.8) + 32).toStringAsPrecision(3);
      });
    }
    if (_value == 'Reaumur') {
      setState(() {
        _infoText = (double.parse(temperatureController.text) * 0.8).toStringAsPrecision(3);
      });
    }
    if (_value == 'Rankine') {
      setState(() {
        _infoText = ((double.parse(temperatureController.text) + 273.15) * 1.8).toStringAsPrecision(3);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Conversor de Temperatura"),
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(40.0, 2.0, 40.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite a temperatura (em celsius)",
                  labelStyle: TextStyle(color: Colors.black),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: temperatureController,
              ),
              SizedBox(
                width: 200.0,
                height: 50.0,
              ),
              SizedBox(
                width: 75.0,
                height: 50.0,
                child: DropdownButton(
                    value: _value,
                    items: _values.map((String value) {
                      return new DropdownMenuItem(
                        value: value,
                        child: new Text('${value}',
                            style:
                                TextStyle(color: Colors.black, fontSize: 25.0)),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      _onChanged(value);
                    }),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 30.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      converte();
                    }, // faz conversao
                    child: Text("CONVERTER",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    color: Colors.black,
                  ),
                ),
              ),
              Text(_infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25.0)),
            ],
          ),
        ));
  }
}
