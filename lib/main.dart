import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterTimeDemo(),
    );
  }
}

class FlutterTimeDemo extends StatefulWidget {
  @override
  _FlutterTimeDemoState createState() => _FlutterTimeDemoState();
}

class _FlutterTimeDemoState extends State<FlutterTimeDemo> {
  String _hour;
  String _minute;
  String _second;
  String _text;
  String _date;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    DateTime now = DateTime.now();
    String formattedHour = _formatHour(now);
    String formattedMinute = _formatMinute(now);
    String formattedSecond = _formatSecond(now);
    String formattedText = _formatText(now);
    String formattedDate = _formatDate(now);
    setState(() {
      _hour = formattedHour;
      _minute = formattedMinute;
      _second = formattedSecond;
      _text = formattedText;
      _date = formattedDate;
    });
  }

  String _formatHour(DateTime dateTime) {
    return DateFormat('hh').format(dateTime);
  }

  String _formatMinute(DateTime dateTime) {
    return DateFormat('mm').format(dateTime);
  }

  String _formatSecond(DateTime dateTime) {
    return DateFormat('ss').format(dateTime);
  }

  String _formatText(DateTime dateTime) {
    return DateFormat('a').format(dateTime);
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat(' EEEE, d MMM').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            FittedBox(
              child: Text(
                _second.toString(),
                style: TextStyle(
                  // fontFamily: 'serif',
                  fontSize: 250,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4
                    ..color = Colors.white12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FittedBox(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      _hour.toString(),
                      style: TextStyle(
                        fontSize: 108,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 7
                          ..color = Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      " ------------ " + _date.toString() + " ------------ ",
                      style: TextStyle(
                        fontSize: 34,
                        // letterSpacing: 2.5,
                        fontFamily: 'serif',
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..color = Colors.white
                          ..strokeWidth = 0.8,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Text(
                            _minute.toString(),
                            style: TextStyle(
                              fontSize: 108,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 7
                                ..color = Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            _text.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'serif',
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
