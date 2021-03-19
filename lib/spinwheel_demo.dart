import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinwheel/flutter_spinwheel.dart';


class SpinWheelDemo extends StatefulWidget {
  @override
  _SpinWheelDemoState createState() => _SpinWheelDemoState();
}

class _SpinWheelDemoState extends State<SpinWheelDemo> {
  List<String> questions;
  List<List<dynamic>> choices;
  List<String> answers;
  int select;

  @override
  void initState() {
    super.initState();
    questions = [
      'Which programming language you will use?',
    ];
    choices = [
      ['Kotlin', 'Swift', 'Dart', 'Java', 'Python', 'C#', 'Ruby', 'PHP'],
    ];
    select = 0;
    answers = ['', '', ''];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text('Flutter SpinWheel Demo '),
        automaticallyImplyLeading: false,
      ),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(30.0),
              height: MediaQuery.of(context).size.height / 1.7,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(questions[index],style: TextStyle(fontSize: 18,
                        color: Colors.black, fontWeight: FontWeight.bold),),
                    Text(answers[index],style: TextStyle(fontSize: 30,
                        color: Colors.cyanAccent,fontWeight: FontWeight.bold),),
                    Center(
                      child: Spinwheel(
                        size: MediaQuery.of(context).size.height*0.6,
                        items: choices[index][0] is String
                            ? choices[index].cast<String>()
                            : null,
                        select: select,
                        autoPlay: false,
                        hideOthers: false,
                        shouldDrawBorder: true,
                        onChanged: (val) {
                          if (this.mounted)
                            setState(() {
                              answers[index] = val;
                            });
                        },
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
