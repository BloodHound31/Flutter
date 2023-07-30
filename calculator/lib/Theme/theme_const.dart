import 'package:flutter/material.dart';


//LightTheme
ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      //Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(30.0),)
            ),
      ),
      //Text theme
      textTheme: TextTheme(
            //Button Text
            headlineSmall: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
            ),
          //Input text
          titleLarge: TextStyle(
                fontSize: 50.0,
                color: Colors.black,
          ),
          //Output text
          headlineMedium: TextStyle(
                fontSize:25.0,
                color: Colors.black.withOpacity(0.7),
          )
      ),
      //Divider colour change only
      dividerTheme: DividerThemeData(
            color: Colors.grey.shade300,
      ),

);


//DarkTheme
ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      //Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF303030)),
                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(30.0),)
            ),
      ),
      //Text Theme
      textTheme: TextTheme(
            //Button text
            headlineSmall: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

            ),
            //Input Text
            titleLarge: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
            ),
            //Output Text
            headlineMedium: TextStyle(
                  fontSize:25.0,
                  color: Colors.white.withOpacity(0.7),
            )
      ),
      //Divider Color only
      dividerTheme: DividerThemeData(
          color: Colors.grey.shade800,
      ),
);