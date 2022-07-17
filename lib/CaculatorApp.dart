// ignore_for_file: prefer_const_constructors, unused_local_variable, deprecated_member_use, file_names
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CaculatorApp extends StatefulWidget {
  const CaculatorApp({ Key? key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CaculatorAppState createState() => _CaculatorAppState();
}

class _CaculatorAppState extends State<CaculatorApp> {
  String equation = '0';
  String result = '0';
  String expression = '0';
  double equationFontsize = 38.0;
  double resultFontsize = 48.0;

  buttonPress(String buttonText){
    setState(() { // cập nhật state
      if (buttonText == "C"){
        equation = "0";
        result = "0";
        double equationFontsize = 38.0;
        double resultFontsize = 48.0; 
      }
      else if (buttonText == "X"){
        double equationFontsize = 38.0;
        double resultFontsize = 48.0; 
        equation = equation.substring(0, equation.length - 1); // chuỗi equation mất 1 ký tự

        if (equation == ""){
        equation = '0';
        }
      }

      else if (buttonText == "="){
        double equationFontsize = 38.0;
        double resultFontsize = 48.0; 
        expression = equation;
        expression = expression.replaceAll("x", "*"); // Chuyển phép nhân thành phép chia

        try {
          // ignore: unnecessary_new
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();

          result = '${exp.evaluate(EvaluationType.REAL, cm)}';

        }
        catch(e){
          result = "Error";
        }
      }
      else{
          equationFontsize = 38.0;
          resultFontsize = 48.0; 
          if (equation == "0"){
            equation = buttonText;
          }
          else{
            equation = equation + buttonText;
          }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * .1 * buttonHeight,

      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
            
          ),
        ),
        padding: EdgeInsets.all(15.0),
        onPressed: () => buttonPress(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caculator App'),
      ),

      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontsize),),
          ),
          
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultFontsize),),
          ),

          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ignore: sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, Colors.blueAccent),
                        buildButton("X", 1, Colors.greenAccent),
                        buildButton("/", 1, Colors.redAccent),
                      ]
                    ),

                    TableRow(
                      children: [
                        buildButton("7", 1, Colors.black),
                        buildButton("8", 1, Colors.black),
                        buildButton("9", 1, Colors.black),
                      ]
                    ),

                    TableRow(
                      children: [
                        buildButton("4", 1, Colors.black),
                        buildButton("5", 1, Colors.black),
                        buildButton("6", 1, Colors.black),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("1", 1, Colors.black),
                        buildButton("2", 1, Colors.black),
                        buildButton("3", 1, Colors.black),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton(".", 1, Colors.black),
                        buildButton("0", 1, Colors.black),
                        buildButton("00", 1, Colors.black),
                      ]
                    ),
                  ],
                ),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width * .25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("+", 1, Colors.blueAccent),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("-", 1, Colors.blueAccent),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("*", 1, Colors.blueAccent),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("/", 1, Colors.blueAccent),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("=", 1, Colors.blueAccent),
                      ]
                    ),
                  ]
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}