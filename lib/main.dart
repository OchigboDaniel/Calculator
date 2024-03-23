import 'package:flutter/material.dart';

import 'mybutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {

  // Get input
  var mathQuetions = '';
  // store answers
  var mathAnswer = '';

  List buttonText = [
        'C', 'DEL', 'ANS', '/',
        '7', '8', '9', '%',
        '4', '5','6', 'x',
        '1','2', '3', '-',
        '.','','=','+' ];

  bool isOperator(String x){
    if (x == '/' || x == 'DEL' || x == '%' || x == 'x' || x == '-' || x == '+' ){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color.fromRGBO(113, 196, 246, 100),
        body: Column(
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 100),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(mathQuetions,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                          ),),
                        )),
                    Container(
                      alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(mathAnswer,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22
                            ),),
                        ))
                  ],
                )),
            Expanded(
              flex: 2,
                child: Container(
            child: GridView.builder(
              itemCount: buttonText.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index){
                  if (index == 0){
                    return MyNumberButton(
                        text: buttonText[0],
                        color: Colors.green,
                        textColor: Colors.white,
                      ontap: (){
                          setState(() {
                            mathQuetions = '';
                          });
                      },);
                  }else if (index == 1) {
                    return MyNumberButton(
                  text: buttonText[1],
                  color: Colors.red,
                  textColor: Colors.white,
                      ontap: (){
                    setState(() {
                      mathQuetions = mathQuetions.substring(0,mathQuetions.length - 1);
                    });
                      },
                  );
                  }else{
                  return MyNumberButton(
                  text: buttonText[index],
                  color: isOperator(buttonText[index]) ? Colors.blueAccent : Colors.white,
                  textColor: isOperator(buttonText[index]) ? Colors.white : Colors.deepPurple,
                    ontap: (){
                    setState(() {
                      mathQuetions += buttonText[index];
                    });
                    },);
                  }
                }),

        )
    )]));
  }

}

