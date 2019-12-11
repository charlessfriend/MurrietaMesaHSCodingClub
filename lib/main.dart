import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Center(child: Text('Murrieta Messa Coding Club!!!')),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Calculator()
    )
  )
);
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //List<Widget> texts = [getText('0'),getText('1')];
  var leftOperand = '';
  var operator = '';
  var rightOperand = '';
  double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('$leftOperand $operator $rightOperand'),
          IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                getNumberButton('1'),
                getNumberButton('2'),
                getNumberButton('3'),
              ],

            ),
          ),
          Row(
            children: <Widget>[
              getNumberButton('4'),
              getNumberButton('5'),
              getNumberButton('6'),
            ],
          ),
          Row(
            children: <Widget>[
              getNumberButton('7'),
              getNumberButton('8'),
              getNumberButton('9'),
            ],
          ),
          Row(
            children: <Widget>[
              getOperatorButton('+'),
              getOperatorButton('-'),
              getOperatorButton('*'),
              getOperatorButton('/'),
            ],
          ),
          RaisedButton(
            child: Text('='),
            onPressed: () {
              setState(() {
                var lOperand = double.parse(leftOperand);
                var rOperand = double.parse(rightOperand);
                switch(operator){
                  case '+' :
                    result = lOperand + rOperand;
                    break;
                  case '-' :
                    result = lOperand - rOperand;
                    break;
                  case '*' :
                    result = lOperand * rOperand;
                    break;
                  case '/':
                    result = lOperand / rOperand;
                    break;
                }
                leftOperand = '';
                rightOperand = '';
                operator = '';
              });
            },
          ),
          Text('Result = $result'),
        ],
      ),
    );
  }

  RaisedButton getNumberButton(String number) {
    var btnText = Text(number);
    var btn = RaisedButton(
      child: btnText,
      onPressed: (){
        setState(() {
          if(operator == '')
            this.leftOperand += number;
          else
            this.rightOperand += number;
        });
      },
    );
    return btn;
  }

  RaisedButton getOperatorButton(String operator) {
    var btnText = Text(operator);
    var btn = RaisedButton(
      child: btnText,
      onPressed: (){
        setState(() {
          this.operator = operator;
        });
      },
    );
    return btn;
  }

}



