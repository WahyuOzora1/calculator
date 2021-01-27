import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Kalkulator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operasi = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      output = "0";
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operasi = "";
    } else if (buttonText == "X" ||
        buttonText == "/" ||
        buttonText == "-" ||
        buttonText == "+") {
      num1 = double.parse(output);
      operasi = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Sudah mengandung desimal");
        return;
      } else {
        _output = _output + buttonText; //ketika ada session
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operasi == "X") {
        _output = (num1 * num2).toString();
      }
      if (operasi == "/") {
        _output = (num1 / num2).toString();
      }
      if (operasi == "-") {
        _output = (num1 - num2).toString();
      }
      if (operasi == "+") {
        _output = (num1 + num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operasi = "0";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      //memenuhi semua elemen widget
      child: OutlineButton(
          padding: EdgeInsets.all(20.0),
          child: Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          onPressed: () =>
              buttonPressed(buttonText) //ketika buttontext di press
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Text(
                output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Divider(), //membuat widget ke halaman bawah
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("X"), //mereturn button di kelas homepagestate
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("/"), //mereturn button di kelas homepagestate
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"), //mereturn button di kelas homepagestate
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"), //mereturn button di kelas homepagestate
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("CLEAR"),
                    buildButton("="),
                    //mereturn button di kelas homepagestate
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
