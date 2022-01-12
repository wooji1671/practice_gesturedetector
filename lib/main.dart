import 'dart:collection';

import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class tempWidget extends StatefulWidget {
  const tempWidget({Key? key}) : super(key: key);

  @override
  _tempWidgetState createState() => _tempWidgetState();
}

class _tempWidgetState extends State<tempWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyStatefulWidget(),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String stringdata = "neutral face";
  bool condition = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Draggable(
                child: Icon(Icons.sentiment_neutral, size: 100,),
                data: stringdata,
                feedback: Icon(Icons.sentiment_neutral, size: 100, color: Colors.red,),
                childWhenDragging: Icon(Icons.sentiment_neutral, size: 100, color: Colors.grey),
              ),
              DragTarget(
                builder: (context, acceptedData, rejectedData) //DragTarget 안에 위젯을 만들어줌
                    {
                      // setState(() {});
                      return stringdata != "neutral face"
                          ? Icon(Icons.sentiment_very_satisfied, size: 100,)
                          : Icon(Icons.dinner_dining, size: 100, color:Colors.orange,);
                    },
                onWillAccept: (data) { //Dragable의 data를 받아들일지 결정
                  print(data);
                  print(condition);
                  if( data == "neutral face") return true;
                  else return false;
                },

                onAccept: (data){ //onWillAccept에서 true가 리턴되면 onAccept가 불러와짐
                  print("accept");

                  condition = true;
                  //data = "smile face";
                  stringdata = "smile face";
                  setState(() {});
                },
              )
            ],
        ),
        //test commit
        FlatButton(
          onPressed: (){
            setState(() {
              condition = false;
              stringdata = "neutral face";
            });
          },
          child: Icon(Icons.refresh, size: 50,),
        ),
      ],
    );
  }
}
