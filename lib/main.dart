import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyWidget(),
      ),
    );
  }
}

// widget class
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int time = DateTime.now().microsecondsSinceEpoch;
  bool start = false;
  double divid = 60.0;
  double divid2 = 60.0;
  double minus = DateTime.now().microsecondsSinceEpoch / 1000000;
  double minus2 = DateTime.now().microsecondsSinceEpoch / 1000000;
  double fminus = 0.0;
  double fminus2 = 0.0;
  int button1 = 2;
  double inbetween1 = 0.0;
  double inbetween2 = 0.0;
  bool justchanged = false;
  bool justchanged2 = false;
  int m = 0;
  int m2 = 0;
  String ftime2 = '01:00';
  String ftime = '01:00';
  double gametime = 60.0;
  String min10 = '0.png';
  String min = '1.png';
  String sec10 = '0.png';
  String sec1 = '0.png';
  List mtime = [];
  String a = '';
  String b = '';
  String c = '';
  String d = '';
  String min102 = '0w.png';
  String min2 = '1w.png';
  String sec102 = '0w.png';
  String sec12 = '0w.png';
  List mtime2 = [];
  String a2 = '';
  String b2 = '';
  String c2 = '';
  String d2 = '';
  String color1 = 'grey';
  String color2 = 'grey';
  bool firsttime = false;
  bool visibility = false;
  bool visibility2 = true;
  double inc = 0.0;
  double incadd = 0.0;
  double incadd2 = 0.0;
  double pausetime = 0.0;
  double pausetime2 = 0.0;
  double imagewidth = 4.9;

  void startSecondScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SecondScreenState(),
        ));

    // after the SecondScreen result comes back, update the Text widget with it
    setState(() {
      gametime = result[0];
      inc = result[1];

      if (gametime > 5999) {
        gametime = 5999;
      }
      restart();
      restart();
    });
  }

  restart() {
    firsttime = false;
    start = false;
    color1 = 'grey';
    color2 = 'grey';
    time = DateTime.now().microsecondsSinceEpoch;

    minus = DateTime.now().microsecondsSinceEpoch / 1000000;
    minus2 = DateTime.now().microsecondsSinceEpoch / 1000000;
    fminus = 0.0;
    fminus2 = 0.0;
    button1 = 2;

    inbetween1 = 0.0;
    inbetween2 = 0.0;
    justchanged = false;
    justchanged2 = false;
    incadd = 0.0;
    incadd2 = 0.0;
    settime1();
    settime2();
  }

  settime2() {
    divid2 = DateTime.now().microsecondsSinceEpoch / 1000000 - time / 1000000;
    divid2.round();
    divid2 -= incadd2;
    divid2 = divid2 - fminus2;
    divid2 = gametime - divid2;
    m2 = 0;
    if (divid2 <= 0) {
      color2 = 'red';
    }
    while (divid2 >= 59.5) {
      m2 += 1;
      divid2 -= 60;
    }
    if (divid2 < 0) {
      divid2 = 0;
    }
    if (divid2 > 9) {
      ftime2 = m2.toString() + ':' + divid2.round().toString();
    }
    if (divid2 < 9.5) {
      ftime2 = m2.toString() + ':' + '0' + divid2.round().toString();
    }
    if (m2 < 10) {
      ftime2 = '0' + ftime2;
    }
    mtime2 = ftime2.split('');
    a2 = mtime2[0];
    b2 = mtime2[1];
    c2 = mtime2[3];
    d2 = mtime2[4];
    min102 = a2 + 'w.png';
    min2 = b2 + 'w.png';
    sec102 = c2 + 'w.png';
    sec12 = d2 + 'w.png';
  }

  settime1() {
    divid = DateTime.now().microsecondsSinceEpoch / 1000000 - time / 1000000;
    divid.round();

    divid -= incadd;

    divid = divid - fminus;
    divid = gametime - divid;
    if (divid <= 0) {
      color1 = 'red';
    }
    m = 0;
    while (divid >= 59.5) {
      m += 1;
      divid -= 60;
    }
    if (divid < 0) {
      divid = 0;
    }
    //what is this condition... what happens if u comment it out?
    if (divid > 9) {
      ftime = m.toString() + ':' + divid.round().toString();
    }
    if (divid < 9.5) {
      ftime = m.toString() + ':' + '0' + divid.round().toString();
    }
    if (m < 10) {
      ftime = '0' + ftime;
    }

    mtime = ftime.split('');
    a = mtime[0];
    b = mtime[1];
    c = mtime[3];
    d = mtime[4];
    min10 = a + '.png';
    min = b + '.png';
    sec10 = c + '.png';
    sec1 = d + '.png';
  }

  Timer periodicSec() {
    // How could this be made to updating every 10th of a second or so.
    // Per op question
    return Timer.periodic(const Duration(milliseconds: 10), (_) {
      setState(() {
        if (start) {
          if (button1 == 1) {
            color1 = 'blue';
            color2 = 'grey';

            if (justchanged) {
              justchanged = false;
              inbetween1 = minus2 - minus;
              fminus += inbetween1;
            }
            settime1();
          }
          if (button1 == 2) {
            color1 = 'grey';
            color2 = 'blue';
            if (justchanged2) {
              justchanged2 = false;
              inbetween2 = minus - minus2;
              fminus2 += inbetween2;
            }
            settime2();

            //divid2=divid2/-100000000000;

          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    periodicSec(); // Kauli's code
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.3,

            //position, height and width of the container

            child: RotatedBox(
                quarterTurns: 2,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (start) {
                        if (button1 == 1) {
                          if (color1 != 'red') {
                            if (color2 != 'red') {
                              justchanged2 = true;
                              button1 = 2;
                              minus = DateTime.now().microsecondsSinceEpoch /
                                  1000000;

                              incadd += inc;
                            }
                          }
                        }
                      }
                    });
                  },
                  //you can change color and size

                  child: visibility
                      ? Center(
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/' + min10,
                                height:
                                    MediaQuery.of(context).size.height / 9.4,
                                width: MediaQuery.of(context).size.width /
                                    imagewidth,
                              ),
                              Image.asset(
                                'assets/' + min,
                                height:
                                    MediaQuery.of(context).size.height / 9.4,
                                width: MediaQuery.of(context).size.width /
                                    imagewidth,
                              ),
                              Text(':',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 5,
                                  )),
                              Image.asset(
                                'assets/' + sec10,
                                height:
                                    MediaQuery.of(context).size.height / 9.4,
                                width: MediaQuery.of(context).size.width /
                                    imagewidth,
                              ),
                              Image.asset(
                                'assets/' + sec1,
                                height:
                                    MediaQuery.of(context).size.height / 9.4,
                                width: MediaQuery.of(context).size.width /
                                    imagewidth,
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Text(
                            ftime,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 7,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                  color: color1 == 'red'
                      ? Colors.red
                      : color1 == 'grey'
                          ? Colors.grey[800]
                          : color1 == 'blue'
                              ? Colors.blue
                              : Colors.yellow,
                )),
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height * (13 / 100),
                child: RaisedButton(
                    color: Colors.black,
                    onPressed: () {
                      restart();
                      restart();
                      startSecondScreen(context);
                    },
                    child: Icon(Icons.settings, color: Colors.white)),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height * (13 / 100),
                child: RaisedButton(
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        if (start) {
                          start = false;
                          pausetime =
                              DateTime.now().microsecondsSinceEpoch / 1000000;
                        } else {
                          start = true;
                          if (firsttime) {
                            if (button1 == 1) {
                              pausetime2 =
                                  DateTime.now().microsecondsSinceEpoch /
                                      1000000;
                              fminus += pausetime2 - pausetime;
                            }
                            if (button1 == 2) {
                              pausetime2 =
                                  DateTime.now().microsecondsSinceEpoch /
                                      1000000;

                              fminus2 += pausetime2 - pausetime;
                            }
                          }
                        }
                        if (firsttime == false) {
                          firsttime = true;
                          time = DateTime.now().microsecondsSinceEpoch;
                          minus =
                              DateTime.now().microsecondsSinceEpoch / 1000000;
                        }
                      });
                    },
                    child: Icon(
                      start == false ? Icons.play_arrow : Icons.pause,
                      color: Colors.white,
                    )),
                color: Colors.black,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height * (13 / 100),
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        restart();
                        restart();
                      });
                    },
                    child: const Icon(Icons.restart_alt),
                    color: Colors.black,
                    textColor: Colors.white,
                  )),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height * (13 / 100),
                child: RaisedButton(
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      if (visibility) {
                        visibility2 = true;
                        visibility = false;
                      } else if (visibility2) {
                        visibility2 = false;
                        visibility = true;
                      }
                    });
                  },
                  child: Text(
                    'Change Pieces',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height / 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(

              ///width: 300.0,
              height: MediaQuery.of(context).size.height / 2.3,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    if (start) {
                      if (button1 == 2) {
                        if (color1 != 'red') {
                          if (color2 != 'red') {
                            justchanged = true;
                            button1 = 1;
                            minus2 =
                                DateTime.now().microsecondsSinceEpoch / 1000000;
                            incadd2 += inc;
                          }
                        }
                      }
                    }
                  });
                },
                child: visibility
                    ? Center(
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/' + min102,
                              height: MediaQuery.of(context).size.height / 9.4,
                              width: MediaQuery.of(context).size.width /
                                  imagewidth,
                            ),
                            Image.asset(
                              'assets/' + min2,
                              height: MediaQuery.of(context).size.height / 9.4,
                              width: MediaQuery.of(context).size.width /
                                  imagewidth,
                            ),
                            Text(':',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 5,
                                )),
                            Image.asset(
                              'assets/' + sec102,
                              height: MediaQuery.of(context).size.height / 9.4,
                              width: MediaQuery.of(context).size.width /
                                  imagewidth,
                            ),
                            Image.asset(
                              'assets/' + sec12,
                              height: MediaQuery.of(context).size.height / 9.4,
                              width: MediaQuery.of(context).size.width /
                                  imagewidth,
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Text(
                          ftime2,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                color: firsttime == false
                    ? Colors.grey[800]
                    : color2 == 'red'
                        ? Colors.red
                        : color2 == 'grey'
                            ? Colors.grey[800]
                            : color2 == 'blue'
                                ? Colors.blue
                                : Colors.yellow,
              )),
        ],
      ),
    );
  }
}

class SecondScreenState extends StatefulWidget {
  const SecondScreenState({Key? key}) : super(key: key);

  @override
  SecondScreen createState() => SecondScreen();
}

// ignore: must_be_immutable
class SecondScreen extends State<SecondScreenState> {
  final List<double> values = [
    15,
    30,
    60,
    120,
    180,
    240,
    300,
    450,
    600,
    900,
    1200,
    1800
  ];
  final List inclabel = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final List labels = [
    '0.25',
    '0.5',
    '1   ',
    '2   ',
    '3   ',
    '4   ',
    '5    ',
    '7.5  ',
    '10  ',
    '15  ',
    '20  ',
    '30  '
  ];
  var time = 60.0;
  var inc = 0.0;
  var end = [60.0, 0.0];
  var seconds = 0.0;
  var maybetext = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      SizedBox(
          height: MediaQuery.of(context).size.height / 20,
          width: MediaQuery.of(context).size.width,
          child: Text('Time',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 25,
              ))),
      SliderTheme(
        data: SliderThemeData(
          trackHeight: MediaQuery.of(context).size.height / 25,
          thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: MediaQuery.of(context).size.height / 46),
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
          activeTrackColor: Colors.black,
          inactiveTrackColor: Colors.grey,
          thumbColor: Colors.black,
          overlayColor: Colors.transparent,
        ),
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height / 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Utils.modelBuilder(
                labels,
                (index, label) {
                  final isSelected = index <= seconds.toInt();
                  final color = isSelected ? Colors.black : Colors.grey;

                  return buildLabel(
                      label: label.toString(), color: color, Color: null);
                },
              ),
            ),
          ),
          Slider(
            value: seconds,
            min: 0,
            max: values.length - 1,
            divisions: values.length - 1,
            onChanged: (double value) {
              setState(() {
                seconds = value;
              });
            },
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 20,
              width: MediaQuery.of(context).size.width,
              child: Text('Increment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 25,
                  ))),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height / 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Utils.modelBuilder(
                inclabel,
                (index, label) {
                  final isSelected = index <= inc.toInt();
                  final color = isSelected ? Colors.black : Colors.grey;

                  return buildLabel2(
                      label: label.toString(), color: color, Color: null);
                },
              ),
            ),
          ),
          Slider(
            value: inc,
            min: 0,
            max: 10,
            divisions: 10,
            onChanged: (double value) {
              setState(() {
                inc = value;
              });
            },
          ),
        ]),
      ),
      Row(children: <Widget>[
        SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              onPressed: () {
                end[1] = inc;
                end[0] = values[seconds.toInt()];

                _sendDataBack(context);
              },
              child: Text('Done!'),
            )),
      ]),
    ]));
  }

  void _sendDataBack(BuildContext context) {
    Navigator.pop(context, end);
  }

  Widget buildLabel({
    required String label,
    @required Color,
    color,
  }) =>
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height / 100),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
          ).copyWith(color: color),
        ),
      );
  Widget buildLabel2({
    required String label,
    @required Color,
    color,
  }) =>
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height / 100),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
          ).copyWith(color: color),
        ),
      );
}

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}
