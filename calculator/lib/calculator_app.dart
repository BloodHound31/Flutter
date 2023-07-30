import 'package:calculator/Theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:calculator/UI/button.dart';
import 'package:calculator/Controller/calculate.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';



class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}


class _CalculatorAppState extends State<CalculatorApp> {


  Color operatorColor = Colors.orange.shade800;
  Calculate calculate = Calculate();//create an object for calculation code to show input and output on the screen
  UI ui = UI();
  final bgColor = MaterialStateProperty.all<Color>(Colors.orange.shade800);



  void onButtonClick(String text) {
    setState(() {
      calculate.onButtonClick(text);
    }); //setState
  } //onButtonClicked


  @override
  Widget build(BuildContext context) {
    final providerTheme = Provider.of<ThemeManager>(context);

    return Scaffold(
      //backgroundColor: Colors.black,

      body: Column(
        children: [
          //Switch
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: FlutterSwitch(
                value: providerTheme.themeMode == ThemeMode.dark,
                onToggle: (newValue){setState(() {
                  providerTheme.toggle(newValue);
                });},
                activeIcon: Icon(Icons.nightlight_outlined),
                inactiveIcon: Icon(Icons.wb_sunny_outlined),
                activeColor: Colors.grey.shade900,
                inactiveColor: Colors.grey.shade200,
                toggleSize: 25.0,
                toggleColor: Colors.transparent,
                width: 55.0,
            ),
          ),

          //Input output
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Input Text
                  Text(
                    calculate.history,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20.0),
                  //Output Text
                  Text(
                    calculate.output,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],//Children(Column)
              ),
            ),
          ),
          SizedBox(height: 30.0),

          Divider(height: 30.0, thickness: 1.0, color: Theme.of(context).dividerTheme.color,),


          //Buttons
          Row(
            children: [
              ui.buttons(text: 'AC',
                  textColor: operatorColor,
                  onPressed: () => onButtonClick('AC'),
                  context: context,
              ),
              ui.buttons(text: '<',
                  textColor: operatorColor,
                  onPressed: () => onButtonClick('<'),
                  context: context,
              ),
              ui.buttons(text: '%',
                  textColor: operatorColor,
                  onPressed: () => onButtonClick('%'),
                context: context,
              ),
              ui.buttons(text: '/',
                  textColor: operatorColor,
                  onPressed: () => onButtonClick('/'),
                  context: context,
              ),
            ],//Children(Row)
          ),
          Row(
            children: [
              ui.buttons(text: '7', onPressed: () => onButtonClick('7'), context: context,),
              ui.buttons(text: '8', onPressed: () => onButtonClick('8'), context: context,),
              ui.buttons(text: '9', onPressed: () => onButtonClick('9'), context: context,),
              ui.buttons(text: 'x',
                  textColor: operatorColor,
                  onPressed: () => onButtonClick('X'),
                  context: context,
              ),
            ],//Children(Row)
          ),
          Row(
            children: [
              ui.buttons(text: '4', onPressed: () => onButtonClick('4'), context: context,),
              ui.buttons(text: '5', onPressed: () => onButtonClick('5'), context: context,),
              ui.buttons(text: '6', onPressed: () => onButtonClick('6'), context: context,),
              ui.buttons(text: '-',
                  textColor: operatorColor,
                  onPressed: () => onButtonClick('-'),
                  context: context,
              ),
            ],//Children(Row)
          ),
          Row(
            children: [
              ui.buttons(text: '1', onPressed: () => onButtonClick('1'), context: context,),
              ui.buttons(text: '2', onPressed: () => onButtonClick('2'), context: context,),
              ui.buttons(text: '3', onPressed: () => onButtonClick('3'), context: context,),
              ui.buttons(text: '+',
                  textColor: operatorColor,
                  onPressed: () => onButtonClick('+'),
                  context: context,
              ),
            ],//Children(Row)
          ),
          Row(
            children: [
              ui.buttons(text: '.', onPressed: () => onButtonClick('.'), context: context,),
              ui.buttons(text: '0', onPressed: () => onButtonClick('0'), context: context,),
              ui.buttons(text: '00', onPressed: () => onButtonClick('00'), context: context,),
              ui.buttons(text: '=',
                  textColor: Colors.white,
                  bgColor: bgColor,
                  onPressed: () => onButtonClick('='),
                  context: context,
              ),
            ],//Children(Row)
          ),
        ],//Children(Column)
      ),
    );
  } //build
}//class



