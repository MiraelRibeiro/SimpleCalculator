import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Calculadora(),
        )
      )
    );
  }
}


class Calculadora extends StatefulWidget{
  @override
  _CalculadoraState createState(){
    return _CalculadoraState();
  }
}

class _CalculadoraState extends State<Calculadora>{

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  double? resultado;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                helperText: 'Informe o primeiro valor',
                fillColor: Colors.blue.shade50,
                prefixIcon: Icon(CupertinoIcons.suit_club_fill),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                )
              ),
              controller: _controller1,
              keyboardType: TextInputType.number,
            )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              double num1 = double.parse(_controller1.text);
              double num2 = double.parse(_controller2.text);
              setState(() {
                resultado = num1 + num2;
              });
            }, child: Text('+')),

            SizedBox(width: 10,),

            ElevatedButton(onPressed: () {
              double num1 = double.parse(_controller1.text);
              double num2 = double.parse(_controller2.text);
              setState(() {
                resultado = num1 - num2;
              });
            }, child: Text('-')),

            SizedBox(width: 10,),

            ElevatedButton(onPressed: () {
              double num1 = double.parse(_controller1.text);
              double num2 = double.parse(_controller2.text);
              setState(() {
                resultado = num1 * num2;
              });
            }, child: Text('*')),

            SizedBox(width: 10,),

            ElevatedButton(onPressed: () {
              double num1 = double.parse(_controller1.text);
              double num2 = double.parse(_controller2.text);
              setState(() {
                resultado = num1 / num2;
              });
            }, child: Text('/')),
          ],
        ),

        Padding(padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  helperText: 'Informe o segundo valor',
                  fillColor: Colors.blue.shade50,
                  prefixIcon: Icon(CupertinoIcons.suit_diamond_fill),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  )
              ),
              controller: _controller2,
              keyboardType: TextInputType.number,
            )
        ),

        Text.rich(
          TextSpan(
            text: 'Resultado = ',
            children: [
              TextSpan(
                text: '${resultado ?? ''}',
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 30,
                  letterSpacing: 6.0
                )
              ),

            ]
          ),
          style: GoogleFonts.roboto(fontSize: 15),
          ),
      ],
    );
  }
}