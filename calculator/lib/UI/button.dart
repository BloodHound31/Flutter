import 'package:flutter/material.dart';

//Used to Create buttons for the calculator
class UI{
   Widget buttons({text, textColor, bgColor, required VoidCallback onPressed, required BuildContext context}){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: onPressed,
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(backgroundColor: bgColor),//Copywith is use to copy the bg colour for the '=' button
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: textColor),//Used to change the text colour for operation keys
          ),
        ),
      ),
    );
  }//buttons

}//class