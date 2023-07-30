import 'package:math_expressions/math_expressions.dart';

//Holds calculation code
class Calculate{

  var input = '';//Input of the user
  var output = '';//Output(Calculations)
  var history = '';//Shows on the user screen[Input]

  onButtonClick(value){
    //Function for 'AC' Key
    if(value == 'AC'){
      input = '';
      output ='';
      history = '';

    }else if(value == '<'){//Function for '<' key
      if(input.isNotEmpty){
        input = input.substring(0, input.length - 1);
        history = input;
      }
    }else if(value == '='){//Function for '=' key
      if(input.isNotEmpty){
        var userInput = input;
        userInput = input.replaceAll('x', '*');//replaces 'x' to '*' to carry out multiplication
        //All these are in the package 'Maths_Expressions'
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        history = input;
        input = output;

      }
    }else{
      input = input + value;
      history = input;
    }
  }//onButtonClick


}//class


