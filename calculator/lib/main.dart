import 'package:flutter/material.dart';
import 'package:calculator/calculator_app.dart';
import 'package:calculator/Theme/theme_manager.dart';
import 'package:calculator/Theme/theme_const.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      child: MyApp(),
  )
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}//MyApp

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    final providerTheme = Provider.of<ThemeManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: providerTheme.themeMode,
      home: CalculatorApp(),
    );
  }
}




