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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    bool condition = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Draggable(
          child: Icon(Icons.sentiment_neutral, size: 100,),
          data: "neutral face",
          feedback: Icon(Icons.sentiment_neutral, size: 100, color: Colors.red,),
          childWhenDragging: Icon(Icons.sentiment_neutral, size: 100, color: Colors.grey),
        ),
          DragTarget(
            builder: (context, acceptedData, rejectedData) //DragTarget 안에 위젯을 만들어줌
                {
                  return condition
                      ? Icon(Icons.sentiment_very_satisfied, size: 100,)
                      : Icon(Icons.dinner_dining, size: 100, color:Colors.orange,);
                },
            onWillAccept: (data) { //Dragable의 data를 받아들일지 결정
              return true;
            },

            onAccept: (data){ //onWillAccept에서 true가 리턴되면 onAccept가 불러와짐
              condition = true;
            },
          )
        ],

          );
  }
}
